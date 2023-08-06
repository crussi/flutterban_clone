// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'columndata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KColumnData {
  int get from => throw _privateConstructorUsedError;
  KColumn get column => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KColumnDataCopyWith<KColumnData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KColumnDataCopyWith<$Res> {
  factory $KColumnDataCopyWith(
          KColumnData value, $Res Function(KColumnData) then) =
      _$KColumnDataCopyWithImpl<$Res, KColumnData>;
  @useResult
  $Res call({int from, KColumn column});

  $KColumnCopyWith<$Res> get column;
}

/// @nodoc
class _$KColumnDataCopyWithImpl<$Res, $Val extends KColumnData>
    implements $KColumnDataCopyWith<$Res> {
  _$KColumnDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? column = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as KColumn,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KColumnCopyWith<$Res> get column {
    return $KColumnCopyWith<$Res>(_value.column, (value) {
      return _then(_value.copyWith(column: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_KColumnDataCopyWith<$Res>
    implements $KColumnDataCopyWith<$Res> {
  factory _$$_KColumnDataCopyWith(
          _$_KColumnData value, $Res Function(_$_KColumnData) then) =
      __$$_KColumnDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int from, KColumn column});

  @override
  $KColumnCopyWith<$Res> get column;
}

/// @nodoc
class __$$_KColumnDataCopyWithImpl<$Res>
    extends _$KColumnDataCopyWithImpl<$Res, _$_KColumnData>
    implements _$$_KColumnDataCopyWith<$Res> {
  __$$_KColumnDataCopyWithImpl(
      _$_KColumnData _value, $Res Function(_$_KColumnData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? column = null,
  }) {
    return _then(_$_KColumnData(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as KColumn,
    ));
  }
}

/// @nodoc

class _$_KColumnData implements _KColumnData {
  const _$_KColumnData({required this.from, required this.column});

  @override
  final int from;
  @override
  final KColumn column;

  @override
  String toString() {
    return 'KColumnData(from: $from, column: $column)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KColumnData &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.column, column) || other.column == column));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, column);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KColumnDataCopyWith<_$_KColumnData> get copyWith =>
      __$$_KColumnDataCopyWithImpl<_$_KColumnData>(this, _$identity);
}

abstract class _KColumnData implements KColumnData {
  const factory _KColumnData(
      {required final int from,
      required final KColumn column}) = _$_KColumnData;

  @override
  int get from;
  @override
  KColumn get column;
  @override
  @JsonKey(ignore: true)
  _$$_KColumnDataCopyWith<_$_KColumnData> get copyWith =>
      throw _privateConstructorUsedError;
}
