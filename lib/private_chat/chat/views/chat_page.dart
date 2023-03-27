import 'package:chat/private_chat/chat/views/chat_view.dart';
import 'package:chat/private_chat/chat/views/widgets/appbar_widget.dart';
import 'package:chat/private_chat/dialog/controller/dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../controller/chat_controller.dart';

class ChatPage extends StatefulWidget {
  final String imageUrl, userName, name;
  final int currentUser;

  const ChatPage(
      {super.key,
      required this.imageUrl,
      required this.currentUser,
      required this.userName,
      required this.name});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final controller = Get.find<ChatController>();
  final newcontroller = Get.find<DialogController>();
  @override
  void initState() {
    controller.getMessages(
        newcontroller.tokenModel.value!.access!, widget.currentUser, 1);

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
        body: SafeArea(
          child: Column(
            children: [
              appBar(widget.name, widget.imageUrl, widget.userName,
                  widget.currentUser),
              Expanded(
                child: ChatView(
                  currentUser: widget.currentUser,
                  imageUrl: widget.imageUrl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
