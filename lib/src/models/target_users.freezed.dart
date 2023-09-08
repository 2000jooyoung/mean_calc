// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'target_users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TargetUsers _$TargetUsersFromJson(Map<String, dynamic> json) {
  return _TargetUsers.fromJson(json);
}

/// @nodoc
mixin _$TargetUsers {
  String get username => throw _privateConstructorUsedError;
  List<TargeSubject> get subjects => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TargetUsersCopyWith<TargetUsers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TargetUsersCopyWith<$Res> {
  factory $TargetUsersCopyWith(
          TargetUsers value, $Res Function(TargetUsers) then) =
      _$TargetUsersCopyWithImpl<$Res, TargetUsers>;
  @useResult
  $Res call({String username, List<TargeSubject> subjects});
}

/// @nodoc
class _$TargetUsersCopyWithImpl<$Res, $Val extends TargetUsers>
    implements $TargetUsersCopyWith<$Res> {
  _$TargetUsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? subjects = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      subjects: null == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<TargeSubject>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TargetUsersCopyWith<$Res>
    implements $TargetUsersCopyWith<$Res> {
  factory _$$_TargetUsersCopyWith(
          _$_TargetUsers value, $Res Function(_$_TargetUsers) then) =
      __$$_TargetUsersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, List<TargeSubject> subjects});
}

/// @nodoc
class __$$_TargetUsersCopyWithImpl<$Res>
    extends _$TargetUsersCopyWithImpl<$Res, _$_TargetUsers>
    implements _$$_TargetUsersCopyWith<$Res> {
  __$$_TargetUsersCopyWithImpl(
      _$_TargetUsers _value, $Res Function(_$_TargetUsers) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? subjects = null,
  }) {
    return _then(_$_TargetUsers(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      subjects: null == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<TargeSubject>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TargetUsers implements _TargetUsers {
  const _$_TargetUsers(
      {required this.username, required final List<TargeSubject> subjects})
      : _subjects = subjects;

  factory _$_TargetUsers.fromJson(Map<String, dynamic> json) =>
      _$$_TargetUsersFromJson(json);

  @override
  final String username;
  final List<TargeSubject> _subjects;
  @override
  List<TargeSubject> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  @override
  String toString() {
    return 'TargetUsers(username: $username, subjects: $subjects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TargetUsers &&
            (identical(other.username, username) ||
                other.username == username) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, username, const DeepCollectionEquality().hash(_subjects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TargetUsersCopyWith<_$_TargetUsers> get copyWith =>
      __$$_TargetUsersCopyWithImpl<_$_TargetUsers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TargetUsersToJson(
      this,
    );
  }
}

abstract class _TargetUsers implements TargetUsers {
  const factory _TargetUsers(
      {required final String username,
      required final List<TargeSubject> subjects}) = _$_TargetUsers;

  factory _TargetUsers.fromJson(Map<String, dynamic> json) =
      _$_TargetUsers.fromJson;

  @override
  String get username;
  @override
  List<TargeSubject> get subjects;
  @override
  @JsonKey(ignore: true)
  _$$_TargetUsersCopyWith<_$_TargetUsers> get copyWith =>
      throw _privateConstructorUsedError;
}
