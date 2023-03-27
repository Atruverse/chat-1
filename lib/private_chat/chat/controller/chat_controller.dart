import 'package:chat/private_chat/dialog/controller/dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'dart:io';
import '../models/chat_model.dart';
import '../repository/chat_repository.dart';

class ChatController extends GetxController {
  final scrollController = ScrollController();
  final contdialog = Get.find<DialogController>();
  RxBool loadingNewMes = false.obs;
  File? image;
  TextEditingController? cont;
  bool firstLoad = true;
  RxBool initailLoaing = false.obs;
  RxList<Results> chatList = <Results>[].obs;
  Rxn<ChatModel> dialogModel = Rxn<ChatModel>();
  final ChatRepository _dialogRepository = ChatRepository();
  RxBool initApiError = false.obs;
  Future<void> getMessages(String token, int currentsender, int page) async {
    firstLoad ? initailLoaing(true) : null;
    final resultOrException =
        await _dialogRepository.getMessageReq(token, currentsender, page);
    resultOrException.fold((l) {
      initApiError(true);
    }, (r) {
      dialogModel(r);
      chatList.value += r.results!;
      // chatList(r.results);
      initailLoaing(false);
      initApiError(false);
    });
  }
}
