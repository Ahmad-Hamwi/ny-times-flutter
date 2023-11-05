import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String src;

  const WebPage({super.key, required this.src});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (String url) {
          setState(() => isLoading = true);
        },
        onPageFinished: (String url) {
          setState(() => isLoading = false);
        },
      ),
    );

  late bool isLoading = true;

  @override
  void initState() {
    controller.loadRequest(Uri.parse(widget.src));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading) const LinearProgressIndicator(),
        ],
      ),
    );
  }
}
