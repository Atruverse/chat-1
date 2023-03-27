import 'package:chat/private_chat/chat/controller/socket_controller.dart';
import 'package:chat/private_chat/dialog/controller/dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../chat/views/chat_page.dart';
import 'widgets/dialog_widget.dart';

class DialogView extends StatelessWidget {
  DialogView({super.key});
  final controller = Get.find<DialogController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.initailLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Obx(() {
              Get.find<SocketController>().receiveMessage();
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.dialogModel.value!.results!.length,
                itemBuilder: (BuildContext context, int index) {
                  return DialogWidget(
                    name: controller.dialogModel.value!.results![index]
                                .chaterProfile!.userName !=
                            null
                        ? controller.dialogModel.value!.results![index]
                            .chaterProfile!.email!
                        : 'mehdi',
                    lastSeen: controller
                        .dialogModel.value!.results![index].lastMsg!.text
                        .toString(),
                    imageUrl: controller.dialogModel.value!.results![index]
                                .chaterProfile!.image !=
                            null
                        ? controller.dialogModel.value!.results![index]
                            .chaterProfile!.image!
                        : "https://cdn.vox-cdn.com/thumbor/vJX7tNAlgS08L-AVb6mAXOPNhcw=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23630684/FVTc_fyWUAA1B3y.jpg",
                    onTap: () {
                      Get.to(() => ChatPage(
                            name: controller.dialogModel.value!.results![index]
                                .chaterProfile!.email!,
                            userName: controller.dialogModel.value!
                                .results![index].chaterProfile!.userName!,
                            imageUrl: controller.dialogModel.value!
                                .results![index].chaterProfile!.image!,
                            currentUser: controller.dialogModel.value!
                                .results![index].chaterProfile!.user as int,
                          ));
                    },
                  );
                },
              );
            });
    });
  }
}
