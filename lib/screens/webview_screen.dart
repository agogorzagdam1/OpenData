import 'package:flutter/material.dart';
import 'package:museos/models/museosnavarra_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final Museo museo;

  WebViewScreen({@required this.museo});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  var isloading;

  @override
  void initState() {
    super.initState();
    isloading = true;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    print("MUSEO: " + widget.museo.getWebUrl());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.museo.nombre),
      ),
      body: Container(
        height: screenSize.height * 0.8645,
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.8645,
              child: WebView(
                initialUrl: widget.museo.getWebUrl(),
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (url) {
                  setState(() {
                    isloading = false;
                  });
                },
              ),
            ),
            isloading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
