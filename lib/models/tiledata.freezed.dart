// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tiledata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KTileData {
  int get from => throw _privateConstructorUsedError;
  KTask get task => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KTileDataCopyWith<KTileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KTileDataCopyWith<$Res> {
  factory $KTileDataCopyWith(KTileData value, $Res Function(KTileData) then) =
      _$KTileDataCopyWithImpl<$Res, KTileData>;
  @useResult
  $Res call({int from, KTask task});

  $KTaskCopyWith<$Res> get task;
}

/// @nodoc
class _$KTileDataCopyWithImpl<$Res, $Val extends KTileData>
    implements $KTileDataCopyWith<$Res> {
  _$KTileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? task = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as KTask,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KTaskCopyWith<$Res> get task {
    return $KTaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_KTileDataCopyWith<$Res> implements $KTileDataCopyWith<$Res> {
  factory _$$_KTileDataCopyWith(
          _$_KTileData value, $Res Function(_$_KTileData) then) =
      __$$_KTileDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int from, KTask task});

  @override
  $KTaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$_KTileDataCopyWithImpl<$Res>
    extends _$KTileDataCopyWithImpl<$Res, _$_KTileData>
    implements _$$_KTileDataCopyWith<$Res> {
  __$$_KTileDataCopyWithImpl(
      _$_KTileData _value, $Res Function(_$_KTileData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? task = null,
  }) {
    return _then(_$_KTileData(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as KTask,
    ));
  }
}

/// @nodoc

class _$_KTileData implements _KTileData {
  const _$_KTileData({required this.from, required this.task});

  @override
  final int from;
  @override
  final KTask task;

  @override
  String toString() {
    return 'KTileData(from: $from, task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KTileData &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, task);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KTileDataCopyWith<_$_KTileData> get copyWith =>
      __$$_KTileDataCopyWithImpl<_$_KTileData>(this, _$identity);
}

abstract class _KTileData implements KTileData {
  const factory _KTileData(
      {required final int from, required final KTask task}) = _$_KTileData;

  @override
  int get from;
  @override
  KTask get task;
  @override
  @JsonKey(ignore: true)
  _$$_KTileDataCopyWith<_$_KTileData> get copyWith =>
      throw _privateConstructorUsedError;
}
