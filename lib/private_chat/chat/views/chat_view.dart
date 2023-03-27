// ignore_for_file: invalid_use_of_protected_member, prefer_if_null_operators

import 'dart:convert';

import 'package:chat/private_chat/chat/controller/socket_controller.dart';
import 'package:chat/private_chat/chat/repository/chat_repository.dart';
import 'package:chat/private_chat/chat/views/widgets/own_msg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../dialog/controller/dialog_controller.dart';
import '../controller/chat_controller.dart';
import 'widgets/other_msg_widget.dart';

// ignore: must_be_immutable
class ChatView extends StatefulWidget {
  int currentUser;
  final String imageUrl;
  ChatView({super.key, required this.imageUrl, required this.currentUser});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final controller = Get.find<ChatController>();

  final socketcont = Get.find<SocketController>();
  final _controller = ScrollController();
  int currentPage = 1;
  @override
  void initState() {
    super.initState();

    // Setup the listener.
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
          // controller.getMessages(
          //     Get.find<DialogController>().tokenModel.value!.access!,
          //     widget.currentUser,
          //     1);
        } else {
          if (ChatRepository.getMessage!.next != null) {
            controller.loadingNewMes.value = true;
            controller.firstLoad = false;
            currentPage += 1;
            controller.getMessages(
                Get.find<DialogController>().tokenModel.value!.access!,
                widget.currentUser,
                currentPage);
            controller.loadingNewMes.value = false;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.initailLoaing.value
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [_buildChatCard(context), _buildSendMsg()],
          ));
  }

  Widget _buildSendMsg() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: Get.find<DialogController>().cont,
            onChanged: (str) {
              if (str.isNotEmpty) {
                Get.find<SocketController>()
                    .channel!
                    .sink
                    .add(jsonEncode({'msg_type': 5}));
              } else {
                Get.find<SocketController>()
                    .channel!
                    .sink
                    .add(jsonEncode({'msg_type': 10}));
              }
            },
            decoration: const InputDecoration(
                hintText: "Type here ...",
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          )),
          IconButton(
              onPressed: () {
                Get.find<SocketController>().uploadFile(widget.currentUser);
                // Get.find<SocketController>().sendMessage(widget.currentUser);
              },
              icon: const Icon(
                Icons.image,
                color: Colors.teal,
              )),
          IconButton(
              onPressed: () {
                Get.find<SocketController>().sendMessage(
                  widget.currentUser,
                );
              },
              icon: const Icon(
                Icons.send,
                color: Colors.teal,
              ))
        ],
      ),
    );
  }

  Widget _buildChatCard(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Obx(() => ListView.builder(
            controller: _controller,
            shrinkWrap: true,
            reverse: true,
            itemCount: controller.chatList.value.length,
            itemBuilder: (ctx, index) {
              bool msgFile =
                  Get.find<ChatController>().chatList.value[index].file != null
                      ? true
                      : false;
              bool msgSelcet = false;
              if (msgFile) {
                msgSelcet = Get.find<ChatController>()
                        .chatList
                        .value[index]
                        .uploaded_by ==
                    Get.find<DialogController>().id;
              } else {
                msgSelcet =
                    Get.find<ChatController>().chatList.value[index].sender ==
                        Get.find<DialogController>().id;
              }
              return Column(
                children: [
                  msgSelcet
                      ? OwnMsgWidget(
                          msgFile: msgFile,
                          index: index,
                        )
                      : OtherMsgWidget(
                          msgFile: msgFile,
                          index: index,
                        ),
                  controller.chatList.value.length - 1 == index &&
                          ChatRepository.getMessage!.next != null
                      ? const CircularProgressIndicator()
                      : const SizedBox()
                ],
              );
            })),
      ),
    );
  }
}
