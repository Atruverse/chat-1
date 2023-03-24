import 'dart:convert';

import 'package:chat/private_chat/chat/controller/chat_controller.dart';
import 'package:chat/private_chat/chat/models/chat_model.dart';
import 'package:chat/private_chat/chat/models/message_send_model.dart';
import 'package:chat/private_chat/chat/models/recive_message.dart';
import 'package:chat/private_chat/dialog/controller/dialog_controller.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:math';

class SocketController extends GetxController {
  final dialogController = Get.find<DialogController>();
  MsgType3 _msgType3 = MsgType3();

  WebSocketChannel channel = IOWebSocketChannel.connect(
    'wss://atrovers.iran.liara.run/chat_ws/${Get.find<DialogController>().id}/',
  );

  receiveMessage() {
    channel.stream.listen((event) {
      if (MsgType3.fromJson(jsonDecode(event)).msgType as int == 3) {
        _msgType3 = MsgType3.fromJson(jsonDecode(event));
        Get.find<ChatController>().chatList.insert(
            0,
            Results(
              read: true,
              sender: int.parse(_msgType3.sender!),
              text: _msgType3.text,
            ));

        update();
      }
    });
  }

  void sendMessage(int currentUse) {
    channel.sink.add(jsonEncode(MessageSendModel().textSend(
        dialogController.cont.value.text.trim(),
        currentUse,
        1 + Random().nextInt(999999 - 1))));

    Get.find<ChatController>().chatList.insert(
        0,
        Results(
          read: true,
          sender: Get.find<DialogController>().id,
          text: dialogController.cont.value.text.trim(),
        ));
    dialogController.cont.text = '';
  }
}
