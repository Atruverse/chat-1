import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/chat_model.dart';
import '../repository/chat_repository.dart';

class ChatController extends GetxController {
  TextEditingController? cont;
  RxBool initailLoaing = false.obs;
  RxList<Result> chatList = <Result>[].obs;
  Rxn<ChatModel> dialogModel = Rxn<ChatModel>();
  final ChatRepository dialogRepository = ChatRepository();
  RxBool initApiError = false.obs;
  Future<void> getMessages(String token) async {
    initailLoaing(true);
    final resultOrException = await dialogRepository.getMessage(token);
    resultOrException.fold((l) {
      initApiError(true);
    }, (r) {
      dialogModel(r);
      chatList(r.results);
      initailLoaing(false);
      initApiError(false);
    });
  }
}
