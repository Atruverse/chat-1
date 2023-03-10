import 'package:get/get.dart';

import '../models/dialog_model.dart';
import '../repository/dialog_repository.dart';

class DialogController extends GetxController {
  RxBool initailLoaing = false.obs;
  Rxn<DialogModel> dialogModel = Rxn<DialogModel>();
  final DialogRepository _dialogRepository = DialogRepository();
  RxBool initApiError = false.obs;
  Future<void> getDialogs() async {
    initailLoaing(true);
    final resultOrException = await _dialogRepository.getDialogs();
    resultOrException.fold((l) {
      initApiError(true);
    }, (r) {
      dialogModel(r);
      initailLoaing(false);
      initApiError(false);
    });
  }
}
