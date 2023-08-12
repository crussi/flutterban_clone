import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import '../utils/theme.dart';
part 'task.freezed.dart';
part 'task.g.dart';

@unfreezed
class KTask with _$KTask {
  factory KTask({
    required String id,
    @Default('') String title,
    @Default('') String description,
    @Default(lightBlue) @ColorConverter() Color themeColor,
  }) = _KTask;

  // Factory method to create a new KTask with a uuid
  factory KTask.newTask() {
    var uuid = const Uuid();
    return KTask(id: uuid.v4());
  }

  // Add the copyWith method
  factory KTask.fromJson(Map<String, dynamic> json) => _$KTaskFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int value) {
    return Color(value);
  }

  @override
  int toJson(Color value) {
    return value.value;
  }
}
