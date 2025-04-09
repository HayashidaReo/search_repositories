import 'package:url_launcher/url_launcher.dart';

Future<void> launchInExternalBrowser(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // 外部ブラウザで開く
    );
  } else {
    throw 'Could not launch $url';
  }
}
