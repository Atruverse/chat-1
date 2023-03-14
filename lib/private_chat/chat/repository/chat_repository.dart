import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../models/chat_model.dart';

class ChatRepository {
  Future<Either<String, ChatModel>> getMessage(String token) async {
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
