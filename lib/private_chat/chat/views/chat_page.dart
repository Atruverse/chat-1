import 'package:chat/private_chat/chat/views/chat_view.dart';
import 'package:chat/private_chat/dialog/controller/dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/chat_controller.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final controller = Get.put<ChatController>(ChatController());
  final newcontroller = Get.find<DialogController>();
  @override
  void initState() {
    controller.getMessages(newcontroller.tokenModel.value!.access!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return true;
      },
      child: Scaffold(
        extendBody: true,
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Center(child: Text('Chat')),
        ),
        body: ChatView(),
      ),
    );
  }
}
