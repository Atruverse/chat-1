import 'package:flutter/material.dart';

class OwnMsgWidget extends StatelessWidget {
  const OwnMsgWidget(
      {super.key,
      required this.imageUrl,
      required this.msgText,
      required this.userName});
  final String imageUrl;
  final String msgText;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2.0, bottom: 4),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        chatCard(context),
        const SizedBox(width: 10),
        _buildImage(),
      ]),
    );
  }

  Widget chatCard(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width) - 150,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
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
            msgText,
            maxLines: 100,
            textDirection: TextDirection.ltr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 25,
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(43)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(43),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                      height: 55,
                      width: 55,
                    )
                  : const Icon(Icons.person, size: 50),
            ),
          ),
        ),
      ),
    );
  }
}
