import 'package:demo/export.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../features/report/widget/report_screen_appbar.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  final String title;
  const WebViewScreen({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: reportScreenAppbar(title),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri.uri(Uri.parse(url)),
        ),

      ),
    );
  }
}
