import 'package:json_annotation/json_annotation.dart';

part 'dialog_model.g.dart';

@JsonSerializable()
@JsonSerializable()
class DialogModel {
  int? count;

  List<Results>? results;

  DialogModel({this.count, this.results});
  factory DialogModel.fromJson(Map<String, dynamic> data) =>
      _$DialogModelFromJson(data);
  Map<String, dynamic> toJson() => _$DialogModelToJson(this);
}

@JsonSerializable()
class Results {
  int? id;
  String? created;
  String? modified;
  LastMsg? lastMsg;
  int? unreadMsgCount;
  ChaterProfile? chaterProfile;

  Results(
      {this.id,
      this.created,
      this.modified,
      this.lastMsg,
      this.unreadMsgCount,
      this.chaterProfile});

  factory Results.fromJson(Map<String, dynamic> data) =>
      _$ResultsFromJson(data);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

@JsonSerializable()
class LastMsg {
  int? id;
  String? text;
  String? created;
  String? modified;
  bool? read;
  int? sender;
  int? recipient;

  LastMsg(
      {this.id,
      this.text,
      this.created,
      this.modified,
      this.read,
      this.sender,
      this.recipient});

  factory LastMsg.fromJson(Map<String, dynamic> data) =>
      _$LastMsgFromJson(data);
  Map<String, dynamic> toJson() => _$LastMsgToJson(this);
}

@JsonSerializable()
class ChaterProfile {
  int? id;
  int? user;
  String? image;
  String? userName;
  String? email;

  ChaterProfile({this.id, this.user, this.image, this.userName, this.email});

  factory ChaterProfile.fromJson(Map<String, dynamic> data) =>
      _$ChaterProfileFromJson(data);
  Map<String, dynamic> toJson() => _$ChaterProfileToJson(this);
}
