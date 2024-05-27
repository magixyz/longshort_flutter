
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:longshort_flutter/src/ui/page/ls_html_page.dart';

class LsAdScreen extends StatefulWidget {

  String content;
  Function next;
  int count;

  LsAdScreen({Key? key,required this.content,required this.next,this.count=0}) : super(key: key);


  @override
  _LsAdScreenState createState() => new _LsAdScreenState();
}

class _LsAdScreenState extends State<LsAdScreen> {

  late int count = widget.count;
  Timer? timer;

  @override
  void initState() {

    if (count > 0){

      timer = Timer.periodic(const Duration(milliseconds: 1000), (timer)async {

        if (-- count > 0 ) {
          setState(() {});
          return;
        }




        widget.next();
        timer.cancel();

      });
    }




    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Stack(
      children: [
        _fullscreenHtml(),
        SafeArea(
          minimum: EdgeInsets.all(16),
            child: Align(
          alignment: Alignment.bottomCenter,
          child:Row(
              children: [
                if (count>0) Material(child: Text('${count}s',style: TextStyle(color: Colors.black),)) ,
                Expanded(child: SizedBox(height: 1,)),
                TextButton(
                    onPressed: () {
                      widget.next();
                      if (timer != null && timer!.isActive) timer!.cancel();
                    },
                    child: Text('跳过')
                )]),

        ))

      ]
    );


    
  }

  _fullscreenHtml(){
    return Builder(builder:(context){
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      return LsHtmlPage(widget.content);
    });
  }

  @override
  void dispose() {
    if (timer != null && timer!.isActive) timer!.cancel();
    super.dispose();
  }
}