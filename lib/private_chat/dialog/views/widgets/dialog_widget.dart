import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget(
      {super.key,
      required this.name,
      required this.status,
      required this.imageUrl});
  final String name;
  final String status;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0XFFFFFFFF),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 1.0,
            offset: const Offset(0.0, 1.0),
          )
        ],
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
        Text(
          status,
          style: const TextStyle(fontSize: 12, color: Color(0XFF979797)),
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
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
                height: 55,
                width: 55,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
