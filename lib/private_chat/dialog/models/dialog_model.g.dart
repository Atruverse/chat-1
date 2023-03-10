// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DialogModel _$DialogModelFromJson(Map<String, dynamic> json) => DialogModel(
      count: json['count'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DialogModelToJson(DialogModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as int?,
      user1: json['user1'] as int?,
      user2: json['user2'] as int?,
      userInfo: json['userInfo'] == null
          ? null
          : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      lastMessage: json['lastMessage'] as String?,
      unreadCount: json['unreadCount'] as int?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'user1': instance.user1,
      'user2': instance.user2,
      'userInfo': instance.userInfo,
      'lastMessage': instance.lastMessage,
      'unreadCount': instance.unreadCount,
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: json['id'] as int?,
      user: json['user'] as int?,
      image: json['image'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'image': instance.image,
      'userName': instance.userName,
      'email': instance.email,
    };
