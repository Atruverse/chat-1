import 'package:flutter/material.dart';

import 'widgets/dialog_widget.dart';

class DialogView extends StatelessWidget {
  const DialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: const DialogWidget(
            name: 'shahram',
            status: 'last seen 2 minute ago',
            imageUrl:
                'https://dayanshop.com/blog/wp-content/uploads/2020/06/bahram-radan-1.jpg',
          ),
        );
      },
    );
  }
}
