import 'package:flutter/material.dart';

import 'dialog_view.dart';

class DialogPage extends StatelessWidget {
  DialogPage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return true;
      },
      child: Scaffold(
        extendBody: true,
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Center(child: Text('Dialogs')),
        ),
        body: const DialogView(),
      ),
    );
  }
}
