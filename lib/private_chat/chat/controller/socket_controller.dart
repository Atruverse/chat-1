import 'dart:convert';
import 'dart:io';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:chat/private_chat/chat/models/file_upload.dart';
import 'package:chat/private_chat/chat/models/user_status_model.dart';
import 'package:dio/dio.dart' as d;
import 'package:file_picker/file_picker.dart';
import 'package:chat/private_chat/chat/controller/chat_controller.dart';
import 'package:chat/private_chat/chat/models/chat_model.dart';
import 'package:chat/private_chat/chat/models/sending_message_model.dart';
import 'package:chat/private_chat/chat/models/receive_message.dart';
import 'package:chat/private_chat/dialog/controller/dialog_controller.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:math';

class SocketController extends GetxController {
  String? pathFile;
  String? fileName;
  Rxn<UserStatusModel> userStatus = Rxn<UserStatusModel>();
  Rxn<UserStatusModel> userStatusTyping = Rxn<UserStatusModel>();
  final dialogController = Get.find<DialogController>();
  MsgType _msgType = MsgType(file: {});
  String? fileId;
  WebSocketChannel? channel;
  UserStatusModel _userStatus = UserStatusModel();

  receiveMessage() {
    channel = IOWebSocketChannel.connect(
        'wss://atrovers.iran.liara.run/chat_ws/${Get.find<DialogController>().id}/');
    channel!.stream.listen((event) {
      if (Results.fromJson(jsonDecode(event)).msg_type == 1 ||
          MsgType.fromJson(jsonDecode(event)).msgType == 2) {
        userStatus.value = UserStatusModel.fromJson(jsonDecode(event));
        _userStatus = UserStatusModel.fromJson(jsonDecode(event));
      } else if (MsgType.fromJson(jsonDecode(event)).msgType as int == 3) {
        _msgType = MsgType.fromJson(jsonDecode(event));
        Get.find<ChatController>().chatList.insert(
            0,
            Results(
              read: true,
              sender: int.parse(_msgType.sender!),
              text: _msgType.text,
            ));

        update();
      } else if (MsgType.fromJson(jsonDecode(event)).msgType as int == 4) {
        Get.find<ChatController>()
            .chatList
            .insert(0, Results.fromJson(jsonDecode(event)));
      } else if (UserStatusModel.fromJson(jsonDecode(event)).msgType == 5 ||
          UserStatusModel.fromJson(jsonDecode(event)).msgType == 10) {
        userStatusTyping.value = UserStatusModel.fromJson(jsonDecode(event));
      }
    });
    update();
  }

  void sendMessage(
    int currentUser,
  ) {
    channel!.sink.add(jsonEncode(MessageSendModel().textSend(
      dialogController.cont.value.text.trim(),
      currentUser,
      1 + Random().nextInt(999999 - 1),
    )));

    Get.find<ChatController>().chatList.insert(
        0,
        Results(
          read: true,
          sender: Get.find<DialogController>().id,
          text: dialogController.cont.value.text.trim(),
        ));
    dialogController.cont.text = '';
  }

  Future<void> downloadFile(String urlPath) async {
    var dio = d.Dio();
    Directory directory = await getApplicationDocumentsDirectory();

    // ignore: unused_local_variable
    var response = dio.download(urlPath,
        '${directory.path}${urlPath.split('/').last.split('?').first.replaceAll(RegExp(r'[^\w.-]+'), '')}');
  }

  Future<void> uploadFile(int currentUser) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    if (result != null) {
      File pickedFile = File(result.files.single.path ?? '');

      int fileSizeInBytes = pickedFile.lengthSync();
      double fileSizeInMB = fileSizeInBytes / (1024 * 1024);

      if (fileSizeInMB < 100) {
        // Check if file size is smaller than 100MB
        pathFile = pickedFile.path;
        fileName = pickedFile.path.split('/').last;
        // print('File size is too large. Maximum allowed size is 100MB.');
        // ignore: avoid_print
        print('filename:$fileName pathFile:$pathFile');
        var dio = d.Dio();
        d.FormData form = d.FormData.fromMap({
          'uploaded_by': 3,
          'file': await d.MultipartFile.fromFile(filename: fileName, pathFile!)
        });
        dio.options.headers["Authorization"] =
            'Bearer ${dialogController.tokenModel.value!.access}';
        final response = dio.post(
            'https://atrovers.iran.liara.run/chat/file_upload/',
            data: form);

        response.then((value) {
          var temp = UploadModelRequest.fromJson(
            value.data as Map<String, dynamic>,
          );

          fileId = temp.id;

          channel!.sink.add(jsonEncode(MessageSendModel().sendResponse(temp.id,
              currentUser.toString(), 1 + Random().nextInt(999999 - 1))));
        }).then((value) {
          Get.find<ChatController>().chatList.insert(
              0,
              Results(
                fileName: fileName,
                uploaded_by: Get.find<DialogController>().id,
                file: FileMap(file: pathFile),
              ));
        });
      } else {}
    }
  }

  onTextChange(String str) {
    // Do something when the text changes.
    if (Get.find<ChatController>().cont!.text.isNotEmpty) {
    } else {}
  }
}
