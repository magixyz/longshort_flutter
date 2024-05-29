
import 'package:json_annotation/json_annotation.dart';
import 'package:longshort_flutter/src/data/entity.dart';

part 'reminder_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ReminderEntity extends Entity{
  String title;
  String content;

  ReminderEntity({super.uuid,super.created_date,super.updated_date,required this.title,required this.content });

  factory ReminderEntity.fromJson(Map<String, dynamic> json) => _$ReminderEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ReminderEntityToJson(this);
}