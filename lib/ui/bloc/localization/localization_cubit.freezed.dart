// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalizationState {
  String? get languageCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalizationStateCopyWith<LocalizationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationStateCopyWith<$Res> {
  factory $LocalizationStateCopyWith(
          LocalizationState value, $Res Function(LocalizationState) then) =
      _$LocalizationStateCopyWithImpl<$Res, LocalizationState>;
  @useResult
  $Res call({String? languageCode});
}

/// @nodoc
class _$LocalizationStateCopyWithImpl<$Res, $Val extends LocalizationState>
    implements $LocalizationStateCopyWith<$Res> {
  _$LocalizationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = freezed,
  }) {
    return _then(_value.copyWith(
      languageCode: freezed == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalizationStateCopyWith<$Res>
    implements $LocalizationStateCopyWith<$Res> {
  factory _$$_LocalizationStateCopyWith(_$_LocalizationState value,
          $Res Function(_$_LocalizationState) then) =
      __$$_LocalizationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? languageCode});
}

/// @nodoc
class __$$_LocalizationStateCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res, _$_LocalizationState>
    implements _$$_LocalizationStateCopyWith<$Res> {
  __$$_LocalizationStateCopyWithImpl(
      _$_LocalizationState _value, $Res Function(_$_LocalizationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = freezed,
  }) {
    return _then(_$_LocalizationState(
      languageCode: freezed == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LocalizationState implements _LocalizationState {
  const _$_LocalizationState({this.languageCode});

  @override
  final String? languageCode;

  @override
  String toString() {
    return 'LocalizationState(languageCode: $languageCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalizationState &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, languageCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalizationStateCopyWith<_$_LocalizationState> get copyWith =>
      __$$_LocalizationStateCopyWithImpl<_$_LocalizationState>(
          this, _$identity);
}

abstract class _LocalizationState implements LocalizationState {
  const factory _LocalizationState({final String? languageCode}) =
      _$_LocalizationState;

  @override
  String? get languageCode;
  @override
  @JsonKey(ignore: true)
  _$$_LocalizationStateCopyWith<_$_LocalizationState> get copyWith =>
      throw _privateConstructorUsedError;
}
