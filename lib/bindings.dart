import 'package:chat/private_chat/chat/controller/socket_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'private_chat/chat/controller/chat_controller.dart';
import 'private_chat/dialog/controller/dialog_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<DialogController>(DialogController());
    Get.put<ChatController>(ChatController());
    Get.lazyPut(() => SocketController());
  }
}
