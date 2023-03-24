import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnMsgWidget extends StatelessWidget {
  const OwnMsgWidget(
      {super.key, required this.msgText, required this.userName});

  final String msgText;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2.0, bottom: 4),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        chatCard(context),
        const SizedBox(width: 10),
        //  _buildImage(),
      ]),
    );
  }

  Widget chatCard(BuildContext context) {
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
          Text(
            userName,
          ),
          const SizedBox(height: 10),
          Text(
            overflow: TextOverflow.ellipsis,
            msgText,
            maxLines: 100,
            textDirection: TextDirection.ltr,
            style: const TextStyle(fontWeight: FontWeight.bold),
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
