import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/dialog_model.dart';

class DialogRepository {
  DialogModel? getDialogResult;
  Future<Either<String, DialogModel>> getDialogs(String token) async {
    final dio = Dio();
    String apiUrl = 'https://atrovers.iran.liara.run/chat/dialogs/';
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      // ignore: unused_local_variable
      final dialogs = await dio.get(apiUrl).then((value) {
        getDialogResult = DialogModel.fromJson(
          value.data as Map<String, dynamic>,
        );
      }).onError((error, stackTrace) {});

      return Right(getDialogResult!);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
