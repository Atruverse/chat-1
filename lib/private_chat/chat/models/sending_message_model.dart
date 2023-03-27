class MessageSendModel {
  Map textSend(
    String? text,
    int userPk,
    int randomId,
  ) {
    return {
      'msg_type': 3,
      'text': text,
      'user_pk': userPk,
      'random_id': randomId
    };
  }

  Map sendResponse(String? fileId, String userPk, int randomId) {
    return {
      'msg_type': 4,
      'user_pk': userPk,
      'random_id': randomId,
    };
  }
}
