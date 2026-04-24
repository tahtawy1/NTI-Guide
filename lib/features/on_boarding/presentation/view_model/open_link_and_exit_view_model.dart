import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class OpenLinkAndExitViewModel {
  static Future<void> openLinkAndExit(String link) async {
    final uri = Uri.parse(link);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
    SystemNavigator.pop();
  }
}
