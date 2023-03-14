// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DialogModel _$DialogModelFromJson(Map<String, dynamic> json) => DialogModel(
      count: json['count'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DialogModelToJson(DialogModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      id: json['id'] as int?,
      created: json['created'] as String?,
      modified: json['modified'] as String?,
      lastMsg: json['lastMsg'] == null
          ? null
          : LastMsg.fromJson(json['lastMsg'] as Map<String, dynamic>),
      unreadMsgCount: json['unreadMsgCount'] as int?,
      chaterProfile: json['chaterProfile'] == null
          ? null
          : ChaterProfile.fromJson(
              json['chaterProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'modified': instance.modified,
      'lastMsg': instance.lastMsg,
      'unreadMsgCount': instance.unreadMsgCount,
      'chaterProfile': instance.chaterProfile,
    };

LastMsg _$LastMsgFromJson(Map<String, dynamic> json) => LastMsg(
      id: json['id'] as int?,
      text: json['text'] as String?,
      created: json['created'] as String?,
      modified: json['modified'] as String?,
      read: json['read'] as bool?,
      sender: json['sender'] as int?,
      recipient: json['recipient'] as int?,
    );

Map<String, dynamic> _$LastMsgToJson(LastMsg instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'created': instance.created,
      'modified': instance.modified,
      'read': instance.read,
      'sender': instance.sender,
      'recipient': instance.recipient,
    };

ChaterProfile _$ChaterProfileFromJson(Map<String, dynamic> json) =>
    ChaterProfile(
      id: json['id'] as int?,
      user: json['user'] as int?,
      image: json['image'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ChaterProfileToJson(ChaterProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'image': instance.image,
      'userName': instance.userName,
      'email': instance.email,
    };
