import 'package:chat/private_chat/dialog/models/token_response_model.dart';
import 'package:get/get.dart';

import '../models/dialog_model.dart';
import '../repository/dialog_repository.dart';
import '../repository/token_repository.dart';

class DialogController extends GetxController {
  RxBool initailLoading = false.obs;
  Rxn<DialogModel> dialogModel = Rxn<DialogModel>();
  final DialogRepository _dialogRepository = DialogRepository();
  Rxn<TokenResponseModel> tokenModel = Rxn<TokenResponseModel>();
  final TokenRepository _tokenRepository = TokenRepository();
  RxBool initApiError = false.obs;
  Future<void> getToken() async {
    initailLoading(true);
    final resultOrException = await _tokenRepository.getToken();
    resultOrException.fold((l) {
      print('we have error${l.toString()}');
      initApiError(true);
    }, (r) {
      print('we don\'t have error ${r.access}');
      tokenModel(r);
      getDialogs(r.access!);
      initApiError(false);
    });
  }

  Future<void> getDialogs(String token) async {
    initailLoading(true);
    final resultOrException = await _dialogRepository.getDialogs(token);
    resultOrException.fold((l) {
      print('we have errror$l');
      initApiError(true);
    }, (r) {
      print('done');
      dialogModel(r);
      initailLoading(false);
      initApiError(false);
    });
  }
}
