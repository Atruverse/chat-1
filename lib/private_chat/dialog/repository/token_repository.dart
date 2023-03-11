import 'package:chat/private_chat/dialog/models/token_request_model.dart';
import 'package:chat/private_chat/dialog/models/token_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TokenRepository {
  Future<Either<String, TokenResponseModel>> getToken() async {
    final dio = Dio();
    String apiUrl = 'https://atrovers.iran.liara.run/account/token/';
    try {
      final dialogs = await dio.post(apiUrl,
          data:
              TokenRequestModel(email: "elyas@gmail.com", password: "12345678")
                  .toJson());
      final TokenResponseModel getDialogResult = TokenResponseModel.fromJson(
        dialogs.data as Map<String, dynamic>,
      );

      return Right(getDialogResult);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
