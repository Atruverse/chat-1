import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget(
      {super.key,
      required this.name,
      required this.lastSeen,
      required this.imageUrl,
      this.onTap});
  final String name;
  final String lastSeen;
  final String imageUrl;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width - 16,
        decoration: BoxDecoration(
          color: const Color(0XFFFFFFFF),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              _buildImage(),
              const SizedBox(width: 8),
              _buildNameColumn()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 14, color: Color(0XFF000000)),
        ),
        const SizedBox(height: 8),
        Container(
          constraints: BoxConstraints(maxWidth: Get.width * .7),
          child: Text(
            overflow: TextOverflow.ellipsis,
            lastSeen,
            style: const TextStyle(fontSize: 12, color: Color(0XFF979797)),
          ),
        ),
      ],
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
