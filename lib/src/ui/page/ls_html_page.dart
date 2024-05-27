import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

class LsHtmlPage extends StatefulWidget {
  LsHtmlPage(this.htmlData, {Key? key}) : super(key: key);

  final String title = 'Test';
  String htmlData;

  @override
  _LsHtmlPageState createState() => new _LsHtmlPageState();
}

class _LsHtmlPageState extends State<LsHtmlPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('flutter_html Example'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Html(
          data: widget.htmlData,
          style: {
            "table": Style(
              backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
            ),
            "tr": Style(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            "th": Style(
              padding: HtmlPaddings.all(6),
              backgroundColor: Colors.grey,
            ),
            "td": Style(
              padding: HtmlPaddings.all(6),
              alignment: Alignment.topLeft,
            ),
            'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
          },

          onCssParseError: (css, messages) {
            print("css that errored: $css");
            print("error messages:");
            messages.forEach((element) {
              print(element);
            });
          },
        ),
      ),
    );
  }
}