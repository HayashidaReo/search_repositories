import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:search_repositories/common_widget/dialog/loading_dialog.dart';
import 'package:search_repositories/common_widget/toast/show_toast.dart';
import 'package:url_launcher/url_launcher.dart';

/// 引数で受け取ったURLを外部ブラウザで開く
Future<void> launchInExternalBrowser(String url, BuildContext context) async {
  final uri = Uri.parse(url);
  final AppLocalizations localizations = AppLocalizations.of(context)!;
  showLoadingDialog(localizations.preparing);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // 外部ブラウザで開く
    );
    hideLoadingDialog();
  } else {
    hideLoadingDialog();
    showToast('${localizations.couldNotLaunchUrl}: $url');
    throw '${localizations.couldNotLaunchUrl}: $url';
  }
}
