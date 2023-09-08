// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TargeSubject _$$_TargeSubjectFromJson(Map<String, dynamic> json) =>
    _$_TargeSubject(
      name: json['name'] as String,
      grade: (json['grade'] as num).toDouble(),
      coefficient: json['coefficient'] as int,
    );

Map<String, dynamic> _$$_TargeSubjectToJson(_$_TargeSubject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'grade': instance.grade,
      'coefficient': instance.coefficient,
    };
