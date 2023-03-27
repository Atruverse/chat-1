import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../controller/dialog_controller.dart';
import 'dialog_view.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final controller = Get.find<DialogController>();

  @override
  void initState() {
    controller.getToken();
    super.initState();
  }

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
        body: DialogView(),
      ),
    );
  }
}
