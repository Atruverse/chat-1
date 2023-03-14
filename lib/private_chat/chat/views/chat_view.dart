import 'package:chat/private_chat/chat/views/widgets/own_msg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/chat_controller.dart';
import 'widgets/other_msg_widget.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  final controller = Get.find<ChatController>();
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
            decoration: const InputDecoration(
                hintText: "Type here ...",
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          )),
          IconButton(
              onPressed: () {},
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
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.chatList.length,
          itemBuilder: (BuildContext context, int index) {
            return StreamBuilder(
                // stream: controller.dialogRepository.getMessage(token),
                builder: (context, snapshot) {
              return OwnMsgWidget(
                  imageUrl:
                      'https://www.irannaz.com/user_files/image/image51/0.585620001346001694_irannaz_com.jpg',
                  msgText: snapshot.hasData ? '${snapshot.data}' : '',
                  userName: controller.chatList[index].sender.toString());
            });
            // OtherMsgWidget(
            //     imageUrl:
            //         'https://www.irannaz.com/user_files/image/image51/0.585620001346001694_irannaz_com.jpg',
            //     msgText:  controller.chatList[index].text!,
            //     userName: controller.chatList[index].sender.toString()),
          },
        ),
      ),
    );
  }
}
