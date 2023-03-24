import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/chat_model.dart';

class ChatRepository {
  static ChatModel? getMessage;
  Future<Either<String, ChatModel>> getMessageReq(
      String token, int user, int page) async {
    final dio = Dio();
    String apiUrl =
        'https://atrovers.iran.liara.run/chat/messages/$user?page=$page';

    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      final dialogs = await dio.get(apiUrl);
      getMessage = ChatModel.fromJson(
        dialogs.data as Map<String, dynamic>,
      );
      // print('getMessage:${dialogs.data}');
      return Right(getMessage!);
    } catch (e) {
      return const Left('e.toString()');
    }
  }
}
