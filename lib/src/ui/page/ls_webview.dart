

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class LsWebview extends StatelessWidget {

  String? title;
  String url;


  LsWebview( this.url, { this.title,  super.key});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(title??''),
      ),
        url: url
    );
  }
}
