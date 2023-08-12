// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KTask _$KTaskFromJson(Map<String, dynamic> json) {
  return _KTask.fromJson(json);
}

/// @nodoc
mixin _$KTask {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  set description(String value) => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get themeColor => throw _privateConstructorUsedError;
  @ColorConverter()
  set themeColor(Color value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KTaskCopyWith<KTask> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KTaskCopyWith<$Res> {
  factory $KTaskCopyWith(KTask value, $Res Function(KTask) then) =
      _$KTaskCopyWithImpl<$Res, KTask>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      @ColorConverter() Color themeColor});
}

/// @nodoc
class _$KTaskCopyWithImpl<$Res, $Val extends KTask>
    implements $KTaskCopyWith<$Res> {
  _$KTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? themeColor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      themeColor: null == themeColor
          ? _value.themeColor
          : themeColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KTaskCopyWith<$Res> implements $KTaskCopyWith<$Res> {
  factory _$$_KTaskCopyWith(_$_KTask value, $Res Function(_$_KTask) then) =
      __$$_KTaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      @ColorConverter() Color themeColor});
}

/// @nodoc
class __$$_KTaskCopyWithImpl<$Res> extends _$KTaskCopyWithImpl<$Res, _$_KTask>
    implements _$$_KTaskCopyWith<$Res> {
  __$$_KTaskCopyWithImpl(_$_KTask _value, $Res Function(_$_KTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? themeColor = null,
  }) {
    return _then(_$_KTask(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      themeColor: null == themeColor
          ? _value.themeColor
          : themeColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KTask implements _KTask {
  _$_KTask(
      {required this.id,
      this.title = '',
      this.description = '',
      @ColorConverter() this.themeColor = lightBlue});

  factory _$_KTask.fromJson(Map<String, dynamic> json) =>
      _$$_KTaskFromJson(json);

  @override
  String id;
  @override
  @JsonKey()
  String title;
  @override
  @JsonKey()
  String description;
  @override
  @JsonKey()
  @ColorConverter()
  Color themeColor;

  @override
  String toString() {
    return 'KTask(id: $id, title: $title, description: $description, themeColor: $themeColor)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KTaskCopyWith<_$_KTask> get copyWith =>
      __$$_KTaskCopyWithImpl<_$_KTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KTaskToJson(
      this,
    );
  }
}

abstract class _KTask implements KTask {
  factory _KTask(
      {required String id,
      String title,
      String description,
      @ColorConverter() Color themeColor}) = _$_KTask;

  factory _KTask.fromJson(Map<String, dynamic> json) = _$_KTask.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get title;
  set title(String value);
  @override
  String get description;
  set description(String value);
  @override
  @ColorConverter()
  Color get themeColor;
  @ColorConverter()
  set themeColor(Color value);
  @override
  @JsonKey(ignore: true)
  _$$_KTaskCopyWith<_$_KTask> get copyWith =>
      throw _privateConstructorUsedError;
}
