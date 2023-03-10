import 'package:chat/private_chat/dialog/controller/dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../chat/views/chat_page.dart';
import 'widgets/dialog_widget.dart';

class DialogView extends StatelessWidget {
  DialogView({super.key});
  final controller = Get.find<DialogController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.initailLoaing.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.dialogModel.value!.results!.length,
            itemBuilder: (BuildContext context, int index) {
              return DialogWidget(
                name: controller.dialogModel.value!.results![index].userInfo !=
                        null
                    ? controller
                        .dialogModel.value!.results![index].userInfo!.userName!
                    : '',
                lastMessage: 'last seen 2 minute ago',
                imageUrl:
                    controller.dialogModel.value!.results![index].userInfo !=
                            null
                        ? controller
                            .dialogModel.value!.results![index].userInfo!.image!
                        : "",
                onTap: () {
                  Get.to(() => const ChatPage());
                },
              );
            },
          ));
  }
}
