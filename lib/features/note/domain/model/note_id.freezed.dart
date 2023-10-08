// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteId {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteIdCopyWith<NoteId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteIdCopyWith<$Res> {
  factory $NoteIdCopyWith(NoteId value, $Res Function(NoteId) then) =
      _$NoteIdCopyWithImpl<$Res, NoteId>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class _$NoteIdCopyWithImpl<$Res, $Val extends NoteId>
    implements $NoteIdCopyWith<$Res> {
  _$NoteIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteIdImplCopyWith<$Res> implements $NoteIdCopyWith<$Res> {
  factory _$$NoteIdImplCopyWith(
          _$NoteIdImpl value, $Res Function(_$NoteIdImpl) then) =
      __$$NoteIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$NoteIdImplCopyWithImpl<$Res>
    extends _$NoteIdCopyWithImpl<$Res, _$NoteIdImpl>
    implements _$$NoteIdImplCopyWith<$Res> {
  __$$NoteIdImplCopyWithImpl(
      _$NoteIdImpl _value, $Res Function(_$NoteIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$NoteIdImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NoteIdImpl implements _NoteId {
  const _$NoteIdImpl({required this.value});

  @override
  final int value;

  @override
  String toString() {
    return 'NoteId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteIdImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteIdImplCopyWith<_$NoteIdImpl> get copyWith =>
      __$$NoteIdImplCopyWithImpl<_$NoteIdImpl>(this, _$identity);
}

abstract class _NoteId implements NoteId {
  const factory _NoteId({required final int value}) = _$NoteIdImpl;

  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$NoteIdImplCopyWith<_$NoteIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
