// class Data {
//   int? msgType;
//   String? userPk;
//   String? text;
//   int? randomId;
//   int? db_id;

//   Data({this.msgType, this.userPk, this.text, this.randomId});

//   Data.fromJson(Map<String, dynamic> json) {
//     msgType = json['msg_type'];
//     userPk = json['user_pk'];
//     text = json['text'];
//     randomId = json['random_id'];
//     db_id = json['db_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['msg_type'] = msgType;
//     data['user_pk'] = userPk;
//     data['text'] = text;
//     data['random_id'] = randomId;
//     data['db_id'] = db_id;
//     return data;
//   }
// }

class MsgType3 {
  int? msgType;
  int? randomId;
  String? text;
  String? sender;
  int? receiver;
  String? senderUsername;

  MsgType3(
      {this.msgType,
      this.randomId,
      this.text,
      this.sender,
      this.receiver,
      this.senderUsername});

  MsgType3.fromJson(Map<String, dynamic> json) {
    msgType = json['msg_type'];
    randomId = json['random_id'];
    text = json['text'];
    sender = json['sender'];
    receiver = json['receiver'];
    senderUsername = json['sender_username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg_type'] = msgType;
    data['random_id'] = randomId;
    data['text'] = text;
    data['sender'] = sender;
    data['receiver'] = receiver;
    data['sender_username'] = senderUsername;
    return data;
  }
}
