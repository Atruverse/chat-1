import 'package:flutter/material.dart';

import 'comment.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return ParentComment(
                content: 'شهرام',
                image:
                    'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
                username: 'فرجی',
                id: '1',
                index: 1,
                dateData: {},
                onTap: (username, id, index) {},
              );
            }));
  }
}
