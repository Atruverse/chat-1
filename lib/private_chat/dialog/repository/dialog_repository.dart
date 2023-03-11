import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/dialog_model.dart';

class DialogRepository {
  Future<Either<String, DialogModel>> getDialogs(String token) async {
    final dio = Dio();
    String apiUrl = 'https://atrovers.iran.liara.run/chat/dialogs/';
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      final dialogs = await dio.get(apiUrl);
      final DialogModel getDialogResult = DialogModel.fromJson(
        dialogs.data as Map<String, dynamic>,
      );

      return Right(getDialogResult);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
