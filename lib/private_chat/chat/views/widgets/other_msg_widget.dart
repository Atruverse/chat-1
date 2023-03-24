import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherMsgWidget extends StatelessWidget {
  const OtherMsgWidget(
      {super.key, required this.msgText, required this.userName});

  final String msgText;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, bottom: 4),
      child: Row(children: [
        //    _buildImage(),
        const SizedBox(width: 10),
        chatCard(context)
      ]),
    );
  }

  Widget chatCard(BuildContext context) {
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
          Text(userName),
          const SizedBox(height: 10),
          Text(
            overflow: TextOverflow.ellipsis,
            msgText,
            textDirection: TextDirection.rtl,
            maxLines: 100,
            style: const TextStyle(fontWeight: FontWeight.bold),
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
