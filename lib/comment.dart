import 'package:flutter/material.dart';

InkWell ParentComment({
  required String content,
  required String image,
  required String username,
  required String id,
  required int index,
  required Map dateData,
  required void Function(String username, String id, int index) onTap,
}) {
  return InkWell(
    onTap: () {
      onTap(username, id, index + 1);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey[100],
              backgroundImage: NetworkImage(
                image,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              // height: 100,
              // width: 150,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          content,
                          maxLines: 5,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(username),
                      Text("${dateData["amount"]} ${dateData["title"]} ago"),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Padding ReplyComment({
  required String content,
  required String image,
  required String username,
  required Map dateData,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 50, bottom: 5, top: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey,
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[100],
            backgroundImage: NetworkImage(
              image,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            // height: 100,
            // width: 150,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        content,
                        maxLines: 5,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(username),
                    Text("${dateData["amount"]} ${dateData["title"]} ago"),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
