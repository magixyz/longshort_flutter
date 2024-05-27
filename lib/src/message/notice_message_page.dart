
import 'package:flutter/material.dart';

import 'package:flutter_cuw_l10n/generated/l10n.dart';
import 'package:longshort_flutter/src/message/message_dao.dart';
import 'package:longshort_flutter/src/message/notice_entity.dart';
import 'package:provider/provider.dart';


class NoticeMessagePage extends StatefulWidget {
  const NoticeMessagePage({super.key});

  @override
  _TheState createState() => _TheState();
}

class _TheState extends State<NoticeMessagePage> {

  late MessageDao messageDao = Provider.of<MessageDao>(context,listen: false);

  List<NoticeEntity> notices = [];

  @override
  void initState() {
    Future.delayed(Duration.zero,()async{
      var ret = await messageDao.noticeRest.restGenericList('notice', (j) => NoticeEntity.fromJson(j));

      if (ret != null) {
        setState(() {
          notices = ret;
        });
      }


      print(notices);
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
            children: notices.map((e) => ListTile(
                title: Text(e.title),
                subtitle: Text(e.content),
            )).toList()
          )
      )
    );

  }

}