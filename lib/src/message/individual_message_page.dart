
import 'package:flutter/material.dart';

import 'package:flutter_cuw_l10n/generated/l10n.dart';
import 'package:longshort_flutter/src/message/reminder_entity.dart';
import 'package:provider/provider.dart';

import '../../longshort_flutter.dart';



class IndividualMessagePage extends StatefulWidget {


  const IndividualMessagePage({super.key});

  @override
  _FormTestRouteState createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<IndividualMessagePage> {

  List<ReminderEntity> reminders = [];

  late MessageDao messageDao = Provider.of<MessageDao>(context,listen: false);

  @override
  void initState() {

    Future.delayed(Duration.zero,()async{
      var ret = await messageDao.reminderRest.restGenericList('reminder', (j) => ReminderEntity.fromJson(j));

      if (ret != null) {
        setState(() {
          reminders = ret;
        });
      }


      print(reminders);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode()); // 触摸收起键盘
      },
      child: Scaffold(
          body: ListView(
              children: reminders.map((e) => ListTile(
                title: Text(e.title),
                subtitle: Text(e.content),
              )).toList()
          )
      )
    );

  }

}