
import 'package:json_annotation/json_annotation.dart';
import 'package:longshort_flutter/src/data/entity.dart';

part 'notice_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NoticeEntity extends Entity{
  String title;
  String content;

  NoticeEntity(super.uuid,super.created_date,super.updated_date,this.title,this.content );

  factory NoticeEntity.fromJson(Map<String, dynamic> json) => _$NoticeEntityFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeEntityToJson(this);
}