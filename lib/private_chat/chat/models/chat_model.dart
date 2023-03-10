import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {
  ChatModel({
    this.count,
    this.results,
  });

  int? count;
  List<Result>? results;

  factory ChatModel.fromJson(Map<String, dynamic> data) =>
      _$ChatModelFromJson(data);
  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}

@JsonSerializable()
class Result {
  Result({
    this.sender,
    this.recipient,
    this.text,
    this.read,
  });

  int? sender;
  int? recipient;
  String? text;
  bool? read;

  factory Result.fromJson(Map<String, dynamic> data) => _$ResultFromJson(data);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
