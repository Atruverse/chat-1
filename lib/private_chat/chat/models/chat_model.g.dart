// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      count: json['count'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'count': instance.count,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      sender: json['sender'] as int?,
      recipient: json['recipient'] as int?,
      text: json['text'] as String?,
      read: json['read'] as bool?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'sender': instance.sender,
      'recipient': instance.recipient,
      'text': instance.text,
      'read': instance.read,
    };
