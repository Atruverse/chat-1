import 'package:chat/private_chat/dialog/models/token_response_model.dart';
import 'package:get/get.dart';

import '../models/dialog_model.dart';
import '../repository/dialog_repository.dart';
import '../repository/token_repository.dart';

class DialogController extends GetxController {
  RxBool initailLoaing = false.obs;
  Rxn<DialogModel> dialogModel = Rxn<DialogModel>();
  final DialogRepository _dialogRepository = DialogRepository();
  Rxn<TokenResponseModel> tokenModel = Rxn<TokenResponseModel>();
  final TokenRepository _tokenRepository = TokenRepository();
  RxBool initApiError = false.obs;
  Future<void> getToken() async {
    initailLoaing(true);
    final resultOrException = await _tokenRepository.getToken();
    resultOrException.fold((l) {
      initApiError(true);
    }, (r) {
      tokenModel(r);
      getDialogs(r.access!);
      initApiError(false);
    });
  }

  Future<void> getDialogs(String token) async {
    initailLoaing(true);
    final resultOrException = await _dialogRepository.getDialogs(token);
    resultOrException.fold((l) {
      initApiError(true);
    }, (r) {
      dialogModel(r);
      initailLoaing(false);
      initApiError(false);
    });
  }
}
