// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReminderEntity _$ReminderEntityFromJson(Map<String, dynamic> json) =>
    ReminderEntity(
      uuid: json['uuid'] as String?,
      created_date: json['created_date'] as String?,
      updated_date: json['updated_date'] as String?,
      title: json['title'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$ReminderEntityToJson(ReminderEntity instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'created_date': instance.created_date,
      'updated_date': instance.updated_date,
      'title': instance.title,
      'content': instance.content,
    };
