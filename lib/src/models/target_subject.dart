import 'package:freezed_annotation/freezed_annotation.dart';

part 'target_subject.freezed.dart';
part 'target_subject.g.dart';

@freezed
class TargeSubject with _$TargeSubject {
  const factory TargeSubject({
    required String name,
    required double grade,
    required int coefficient,
  }) = _TargeSubject;

  factory TargeSubject.fromJson(Map<String, dynamic> json) =>
      _$TargeSubjectFromJson(json);
}
