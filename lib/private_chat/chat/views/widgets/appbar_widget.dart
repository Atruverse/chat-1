import 'package:chat/private_chat/chat/controller/socket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

Widget appBar(String name, String image, String userName, int id) {
  final controller = Get.find<SocketController>();
  return Container(
    width: double.infinity,
    height: 70,
    color: Colors.white,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BackButton(
          onPressed: () => Get.back(),
        ),
        Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(100),
              border: Border.all(width: 1, color: Colors.grey.shade800)),
          child: Stack(
            children: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(100),
                      child: Image.network(
                        image,
                        fit: BoxFit.fill,
                      ))),
              Align(
                alignment: Alignment.bottomRight,
                child: Obx(() => controller.userStatus.value != null
                    ? Container(
                        margin: const EdgeInsets.only(bottom: 8, right: 8),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                            color: controller.userStatus.value!.user_pk
                                            .toString() ==
                                        id.toString() &&
                                    controller.userStatus.value!.msgType == 1
                                ? Colors.green
                                : Colors.grey,
                            shape: BoxShape.circle),
                      )
                    : const SizedBox()),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 5,
            ),
            Obx(() => controller.userStatusTyping.value != null
                ? Text(controller.userStatusTyping.value!.msgType == 10
                    ? userName
                    : '$userName is typing...')
                : Text(userName))
          ],
        )
      ],
    ),
  );
}
