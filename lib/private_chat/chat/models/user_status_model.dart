class UserStatusModel {
  int? msgType;
  // ignore: non_constant_identifier_names
  String? user_pk;
  // ignore: non_constant_identifier_names
  UserStatusModel({this.msgType, this.user_pk});

  UserStatusModel.fromJson(Map<String, dynamic> json) {
    msgType = json['msg_type'];
    user_pk = json['user_pk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg_type'] = msgType;
    data['user_pk'] = user_pk;

    return data;
  }
}
