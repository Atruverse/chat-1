import 'package:json_annotation/json_annotation.dart';

part 'dialog_model.g.dart';

@JsonSerializable()
class DialogModel {
  DialogModel({
    this.count,
    this.results,
  });

  int? count;
  List<Result>? results;

  factory DialogModel.fromJson(Map<String, dynamic> data) =>
      _$DialogModelFromJson(data);
  Map<String, dynamic> toJson() => _$DialogModelToJson(this);
}

@JsonSerializable()
class Result {
  Result({
    this.id,
    this.user1,
    this.user2,
    this.userInfo,
    this.lastMessage,
    this.unreadCount,
  });

  int? id;
  int? user1;
  int? user2;
  UserInfo? userInfo;
  String? lastMessage;
  int? unreadCount;

  factory Result.fromJson(Map<String, dynamic> data) => _$ResultFromJson(data);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class UserInfo {
  UserInfo({
    this.id,
    this.user,
    this.image,
    this.userName,
    this.email,
  });

  int? id;
  int? user;
  String? image;
  String? userName;
  String? email;

  factory UserInfo.fromJson(Map<String, dynamic> data) =>
      _$UserInfoFromJson(data);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
