
import 'package:flutter/material.dart';


import 'package:flutter_cuw_l10n/flutter_cuw_l10n.dart';

import 'individual_message_page.dart';
import 'notice_message_page.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text(Cuw.current.message),
              leading: null,
              automaticallyImplyLeading:false,
              actions: [
                TextButton(onPressed: /*progress>0&&progress<1?null:*/ (){

                  Navigator.pop(context);

                }, child: const Icon(Icons.close))
              ],
              bottom: TabBar(
                  indicatorColor: Colors.black87,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.black38,
                  labelPadding: EdgeInsets.all(2),
                  labelStyle: TextStyle(fontSize: 16),
                  tabs: [Tab(
                      text: Cuw.current.notice_message
                  ),Tab(
                      text: Cuw.current.individual_message
                  )]
              ),
            ),
            body: const TabBarView(
                children: [
                  NoticeMessagePage(),
                  IndividualMessagePage()
                ]
            )));

  }
}
