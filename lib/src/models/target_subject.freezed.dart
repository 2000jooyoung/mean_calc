// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'target_subject.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TargeSubject _$TargeSubjectFromJson(Map<String, dynamic> json) {
  return _TargeSubject.fromJson(json);
}

/// @nodoc
mixin _$TargeSubject {
  String get name => throw _privateConstructorUsedError;
  double get grade => throw _privateConstructorUsedError;
  int get coefficient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TargeSubjectCopyWith<TargeSubject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TargeSubjectCopyWith<$Res> {
  factory $TargeSubjectCopyWith(
          TargeSubject value, $Res Function(TargeSubject) then) =
      _$TargeSubjectCopyWithImpl<$Res, TargeSubject>;
  @useResult
  $Res call({String name, double grade, int coefficient});
}

/// @nodoc
class _$TargeSubjectCopyWithImpl<$Res, $Val extends TargeSubject>
    implements $TargeSubjectCopyWith<$Res> {
  _$TargeSubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? grade = null,
    Object? coefficient = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as double,
      coefficient: null == coefficient
          ? _value.coefficient
          : coefficient // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TargeSubjectCopyWith<$Res>
    implements $TargeSubjectCopyWith<$Res> {
  factory _$$_TargeSubjectCopyWith(
          _$_TargeSubject value, $Res Function(_$_TargeSubject) then) =
      __$$_TargeSubjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double grade, int coefficient});
}

/// @nodoc
class __$$_TargeSubjectCopyWithImpl<$Res>
    extends _$TargeSubjectCopyWithImpl<$Res, _$_TargeSubject>
    implements _$$_TargeSubjectCopyWith<$Res> {
  __$$_TargeSubjectCopyWithImpl(
      _$_TargeSubject _value, $Res Function(_$_TargeSubject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? grade = null,
    Object? coefficient = null,
  }) {
    return _then(_$_TargeSubject(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as double,
      coefficient: null == coefficient
          ? _value.coefficient
          : coefficient // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TargeSubject implements _TargeSubject {
  const _$_TargeSubject(
      {required this.name, required this.grade, required this.coefficient});

  factory _$_TargeSubject.fromJson(Map<String, dynamic> json) =>
      _$$_TargeSubjectFromJson(json);

  @override
  final String name;
  @override
  final double grade;
  @override
  final int coefficient;

  @override
  String toString() {
    return 'TargeSubject(name: $name, grade: $grade, coefficient: $coefficient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TargeSubject &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.coefficient, coefficient) ||
                other.coefficient == coefficient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, grade, coefficient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TargeSubjectCopyWith<_$_TargeSubject> get copyWith =>
      __$$_TargeSubjectCopyWithImpl<_$_TargeSubject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TargeSubjectToJson(
      this,
    );
  }
}

abstract class _TargeSubject implements TargeSubject {
  const factory _TargeSubject(
      {required final String name,
      required final double grade,
      required final int coefficient}) = _$_TargeSubject;

  factory _TargeSubject.fromJson(Map<String, dynamic> json) =
      _$_TargeSubject.fromJson;

  @override
  String get name;
  @override
  double get grade;
  @override
  int get coefficient;
  @override
  @JsonKey(ignore: true)
  _$$_TargeSubjectCopyWith<_$_TargeSubject> get copyWith =>
      throw _privateConstructorUsedError;
}
