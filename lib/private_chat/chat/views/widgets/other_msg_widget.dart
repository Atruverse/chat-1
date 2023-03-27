import 'package:chat/private_chat/chat/controller/chat_controller.dart';
import 'package:chat/private_chat/chat/controller/socket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';

class OtherMsgWidget extends StatelessWidget {
  const OtherMsgWidget({super.key, required this.msgFile, this.index});

  final bool msgFile;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, bottom: 4),
      child: Row(children: [
        //    _buildImage(),
        const SizedBox(width: 10),
        chatCard(context, index)
      ]),
    );
  }

  Widget chatCard(BuildContext context, index) {
    List<String> linkParts =
        Get.find<ChatController>().chatList[index].file != null
            ? Get.find<ChatController>().chatList[index].file!.file!.split('/')
            : [];
    return Container(
      constraints: BoxConstraints(maxWidth: Get.width * .75),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              msgFile
                  ? InkWell(
                      onTap: () => Get.find<SocketController>().downloadFile(
                          Get.find<ChatController>()
                              .chatList[index]
                              .file!
                              .file
                              .toString()),
                      child: const Icon(Icons.file_present_outlined))
                  : const SizedBox(),
              Text(
                overflow: TextOverflow.ellipsis,
                msgFile
                    ? linkParts[linkParts.length - 1].split('.')[0]
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

//   Widget _buildImage() {
//     return CircleAvatar(
//       radius: 30,
//       backgroundColor: Colors.grey,
//       child: CircleAvatar(
//         radius: 28,
//         backgroundColor: Colors.white,
//         child: CircleAvatar(
//           radius: 25,
//           child: Container(
//             height: 55,
//             width: 55,
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(43)),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(43),
//               child: imageUrl.isNotEmpty
//                   ? Image.network(
//                       imageUrl,
//                       fit: BoxFit.fill,
//                       height: 55,
//                       width: 55,
//                     )
//                   : const Icon(Icons.person, size: 50),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
}
