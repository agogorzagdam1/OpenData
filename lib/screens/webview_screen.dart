import 'package:flutter/material.dart';
import 'package:museos/models/museosnavarra_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final Museo museo;

  WebViewScreen({@required this.museo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(museo.nombre),
      ),
      body: WebView(
        initialUrl: museo.getWebUrl(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
