// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KTask _$$_KTaskFromJson(Map<String, dynamic> json) => _$_KTask(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      themeColor: json['themeColor'] == null
          ? lightBlue
          : const ColorConverter().fromJson(json['themeColor'] as int),
    );

Map<String, dynamic> _$$_KTaskToJson(_$_KTask instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'themeColor': const ColorConverter().toJson(instance.themeColor),
    };
