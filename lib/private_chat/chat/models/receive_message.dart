class MsgType {
  int? msgType;
  int? randomId;
  int? dbId;
  late Map<String, dynamic> file;
  String? text;
  String? sender;
  int? receiver;
  String? senderUsername;

  MsgType(
      {this.msgType,
      this.dbId,
      required this.file,
      this.randomId,
      this.text,
      this.sender,
      this.receiver,
      this.senderUsername});

  MsgType.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    dbId = json['dbId'];
    msgType = json['msg_type'];
    randomId = json['random_id'];
    text = json['text'];
    sender = json['sender'];
    receiver = json['receiver'] is String ? int.parse(json['receiver']) : null;
    senderUsername = json['sender_username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg_type'] = msgType;
    data['random_id'] = randomId;
    data['file'] = file;
    data['dbId'] = dbId;
    data['text'] = text;
    data['sender'] = sender;
    data['receiver'] = receiver;
    data['sender_username'] = senderUsername;
    return data;
  }
}
