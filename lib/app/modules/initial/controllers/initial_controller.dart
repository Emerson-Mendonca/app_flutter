import 'dart:async';
import 'dart:io' show Platform;

import 'package:app_flutter/app/routes/app_pages.dart';
import 'package:app_flutter/app/utils/DebugLog.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

var debugLog = DebugLog();

class InitialController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    await _checkVersion();

    await loading();
  }

  Future<void> loading() async {
    Timer(const Duration(seconds: 2), () {
      Get.offAndToNamed(Routes.HOME);
    });
  }

  Future<void> _checkVersion() async {
    if (await getPackageInfo().then((value) => value.version == "0.0.2")) {
      return;
    }

    if (Platform.isAndroid || Platform.isIOS) {
      String appId = "";

      await getPackageInfo().then((value) {
        appId = value.packageName;
      });

      final url = Uri.parse(
        Platform.isAndroid
            ? "market://details?id=$appId"
            : "https://apps.apple.com/app/id$appId",
      );

      launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  Future<PackageInfo> getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }
}
