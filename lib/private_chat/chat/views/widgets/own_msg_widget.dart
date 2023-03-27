import 'package:chat/private_chat/chat/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';

class OwnMsgWidget extends StatelessWidget {
  const OwnMsgWidget({
    super.key,
    required this.msgFile,
    this.index,
  });
  final bool msgFile;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2.0, bottom: 4),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        chatCard(context, index as int),
        const SizedBox(width: 10),
        //  _buildImage(),
      ]),
    );
  }

  Widget chatCard(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      constraints: BoxConstraints(maxWidth: Get.width * .75),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(0),
            bottomLeft: Radius.circular(12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              msgFile
                  ? const Icon(Icons.file_present_outlined)
                  : const SizedBox(),
              Text(
                overflow: TextOverflow.ellipsis,
                msgFile
                    ? Get.find<ChatController>()
                        .chatList[index]
                        .file!
                        .file!
                        .split("\\")
                        .last
                        .replaceAll(".png", "")
                        .toString()
                    : Get.find<ChatController>().chatList[index].text!,
                maxLines: 100,
                textDirection: TextDirection.ltr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildImage() {
  //   return CircleAvatar(
  //     radius: 30,
  //     backgroundColor: Colors.grey,
  //     child: CircleAvatar(
  //       radius: 28,
  //       backgroundColor: Colors.white,
  //       child: CircleAvatar(
  //         radius: 25,
  //         child: Container(
  //           height: 55,
  //           width: 55,
  //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(43)),
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(43),
  //             child: imageUrl.isNotEmpty
  //                 ? Image.network(
  //                     imageUrl,
  //                     fit: BoxFit.fill,
  //                     height: 55,
  //                     width: 55,
  //                   )
  //                 : const Icon(Icons.person, size: 50),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
