import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget appBar(String name, String image, String userName) {
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
          child: ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(100),
              child: Image.network(
                image,
                fit: BoxFit.fill,
              )),
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
            Text(userName),
          ],
        )
      ],
    ),
  );
}
