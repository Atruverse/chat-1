import 'package:get/get.dart';

import '../models/chat_model.dart';
import '../repository/chat_repository.dart';

class ChatController extends GetxController {
  RxBool initailLoaing = false.obs;
  RxList<Result> chatList = <Result>[].obs;
  Rxn<ChatModel> dialogModel = Rxn<ChatModel>();
  final ChatRepository _dialogRepository = ChatRepository();
  RxBool initApiError = false.obs;
  Future<void> getMessages() async {
    initailLoaing(true);
    final resultOrException = await _dialogRepository.getMessage();
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
