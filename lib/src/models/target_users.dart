import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mean_calc/src/models/target_subject.dart';

part 'target_users.freezed.dart';
part 'target_users.g.dart';

@freezed
class TargetUsers with _$TargetUsers {
  const factory TargetUsers({
    required String username,
    required List<TargeSubject> subjects,
  }) = _TargetUsers;

  factory TargetUsers.fromJson(Map<String, dynamic> json) =>
      _$TargetUsersFromJson(json);
}
