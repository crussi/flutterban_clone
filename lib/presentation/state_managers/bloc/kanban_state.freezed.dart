// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kanban_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KanbanState {
  List<KColumn> get columns => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  KTask? get selectedTask => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KanbanStateCopyWith<KanbanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KanbanStateCopyWith<$Res> {
  factory $KanbanStateCopyWith(
          KanbanState value, $Res Function(KanbanState) then) =
      _$KanbanStateCopyWithImpl<$Res, KanbanState>;
  @useResult
  $Res call({List<KColumn> columns, Status status, KTask? selectedTask});

  $KTaskCopyWith<$Res>? get selectedTask;
}

/// @nodoc
class _$KanbanStateCopyWithImpl<$Res, $Val extends KanbanState>
    implements $KanbanStateCopyWith<$Res> {
  _$KanbanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columns = null,
    Object? status = null,
    Object? selectedTask = freezed,
  }) {
    return _then(_value.copyWith(
      columns: null == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as List<KColumn>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      selectedTask: freezed == selectedTask
          ? _value.selectedTask
          : selectedTask // ignore: cast_nullable_to_non_nullable
              as KTask?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KTaskCopyWith<$Res>? get selectedTask {
    if (_value.selectedTask == null) {
      return null;
    }

    return $KTaskCopyWith<$Res>(_value.selectedTask!, (value) {
      return _then(_value.copyWith(selectedTask: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_KanbanStateCopyWith<$Res>
    implements $KanbanStateCopyWith<$Res> {
  factory _$$_KanbanStateCopyWith(
          _$_KanbanState value, $Res Function(_$_KanbanState) then) =
      __$$_KanbanStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<KColumn> columns, Status status, KTask? selectedTask});

  @override
  $KTaskCopyWith<$Res>? get selectedTask;
}

/// @nodoc
class __$$_KanbanStateCopyWithImpl<$Res>
    extends _$KanbanStateCopyWithImpl<$Res, _$_KanbanState>
    implements _$$_KanbanStateCopyWith<$Res> {
  __$$_KanbanStateCopyWithImpl(
      _$_KanbanState _value, $Res Function(_$_KanbanState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columns = null,
    Object? status = null,
    Object? selectedTask = freezed,
  }) {
    return _then(_$_KanbanState(
      columns: null == columns
          ? _value._columns
          : columns // ignore: cast_nullable_to_non_nullable
              as List<KColumn>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      selectedTask: freezed == selectedTask
          ? _value.selectedTask
          : selectedTask // ignore: cast_nullable_to_non_nullable
              as KTask?,
    ));
  }
}

/// @nodoc

class _$_KanbanState implements _KanbanState {
  const _$_KanbanState(
      {final List<KColumn> columns = const [],
      required this.status,
      this.selectedTask})
      : _columns = columns;

  final List<KColumn> _columns;
  @override
  @JsonKey()
  List<KColumn> get columns {
    if (_columns is EqualUnmodifiableListView) return _columns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_columns);
  }

  @override
  final Status status;
  @override
  final KTask? selectedTask;

  @override
  String toString() {
    return 'KanbanState(columns: $columns, status: $status, selectedTask: $selectedTask)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KanbanState &&
            const DeepCollectionEquality().equals(other._columns, _columns) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.selectedTask, selectedTask) ||
                other.selectedTask == selectedTask));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_columns), status, selectedTask);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KanbanStateCopyWith<_$_KanbanState> get copyWith =>
      __$$_KanbanStateCopyWithImpl<_$_KanbanState>(this, _$identity);
}

abstract class _KanbanState implements KanbanState {
  const factory _KanbanState(
      {final List<KColumn> columns,
      required final Status status,
      final KTask? selectedTask}) = _$_KanbanState;

  @override
  List<KColumn> get columns;
  @override
  Status get status;
  @override
  KTask? get selectedTask;
  @override
  @JsonKey(ignore: true)
  _$$_KanbanStateCopyWith<_$_KanbanState> get copyWith =>
      throw _privateConstructorUsedError;
}
