// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReminderEntity _$ReminderEntityFromJson(Map<String, dynamic> json) =>
    ReminderEntity(
      json['uuid'] as String,
      json['created_date'] as String,
      json['updated_date'] as String,
      json['title'] as String,
      json['content'] as String,
    );

Map<String, dynamic> _$ReminderEntityToJson(ReminderEntity instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'created_date': instance.created_date,
      'updated_date': instance.updated_date,
      'title': instance.title,
      'content': instance.content,
    };
