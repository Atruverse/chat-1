import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../constant/constant.dart';
import '../models/chat_model.dart';

class DialogRepository {
  Future<Either<String, ChatModel>> getMessage() async {
    final dio = Dio();
    String apiUrl = 'https://atrovers.iran.liara.run/chat/messages/2/';
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      final dialogs = await dio.get(apiUrl);
      final ChatModel getMessage = ChatModel.fromJson(
        dialogs.data as Map<String, dynamic>,
      );

      return Right(getMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
