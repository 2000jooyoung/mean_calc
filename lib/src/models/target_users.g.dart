// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TargetUsers _$$_TargetUsersFromJson(Map<String, dynamic> json) =>
    _$_TargetUsers(
      username: json['username'] as String,
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => TargeSubject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TargetUsersToJson(_$_TargetUsers instance) =>
    <String, dynamic>{
      'username': instance.username,
      'subjects': instance.subjects,
    };
