import 'package:chat/private_chat/dialog/models/token_response_model.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import '../models/dialog_model.dart';
import '../repository/dialog_repository.dart';
import '../repository/token_repository.dart';

class DialogController extends GetxController {
  WebSocketChannel? channel;
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
      print(r.access);

      channel = IOWebSocketChannel.connect(
        'wss://atrovers.iran.liara.run/chat_ws/${r.id}/',
      );
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
