
import 'package:longshort_flutter/src/net/generic_rest.dart';

import 'notice_entity.dart';
import 'reminder_entity.dart';

class MessageDao{

  String baseUrl;


  late GenericRest<NoticeEntity> noticeRest = GenericRest<NoticeEntity>(this.baseUrl);
  late GenericRest<ReminderEntity> reminderRest = GenericRest<ReminderEntity>(this.baseUrl);

  MessageDao(this.baseUrl);

}