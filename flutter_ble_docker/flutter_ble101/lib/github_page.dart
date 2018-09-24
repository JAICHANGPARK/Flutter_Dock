import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class GithubClass extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(title: Text("Dreamwalker Flutter Docker"),
      ),
      url: "https://github.com/JAICHANGPARK/Flutter_Dock",
      withZoom: true,
      withJavascript: true,
    );
  }
}
