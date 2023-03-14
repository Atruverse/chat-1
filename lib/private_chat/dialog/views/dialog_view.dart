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
    return Obx(() => controller.initailLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.dialogModel.value!.results!.length,
            itemBuilder: (BuildContext context, int index) {
              return DialogWidget(
                name:
                    // controller.dialogModel.value!.results![index]
                    //         .chaterProfile!.userName!.isNotEmpty
                    //     ? controller.dialogModel.value!.results![index]
                    //         .chaterProfile!.userName!
                    //     :
                    'Mehdi$index',
                lastMessage: 'last seen 2 minute ago',
                imageUrl:
                    //  controller.dialogModel.value!.results![index]
                    //         .chaterProfile!.image!.isNotEmpty
                    //     ? controller.dialogModel.value!.results![index]
                    //         .chaterProfile!.image!
                    //     :
                    "https://cdn.vox-cdn.com/thumbor/vJX7tNAlgS08L-AVb6mAXOPNhcw=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23630684/FVTc_fyWUAA1B3y.jpg",
                onTap: () {
                  Get.to(() => const ChatPage());
                },
              );
            },
          ));
  }
}
