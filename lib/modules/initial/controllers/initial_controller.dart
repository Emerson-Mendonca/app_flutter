import 'dart:async';
import 'dart:io' show Platform;

import 'package:app_flutter/core/routes/app_pages.dart';
import 'package:app_flutter/core/theme/controllers/theme_controller.dart';
import 'package:app_flutter/core/utils/DebugLog.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

var debugLog = DebugLog();

class InitialController extends GetxController {
  @override
  void onInit() {
    Get.find<ThemeController>().getThemeStatus();
    loading();
    super.onInit();
  }

  Future<void> loading() async {
    Timer(const Duration(seconds: 3), () {
      Get.offAndToNamed(Routes.HOME);
    });
  }

  Future<void> _checkVersion() async {
    if (await getPackageInfo().then((value) => value.version == "0.0.3")) {
      return;
    }

    if (Platform.isAndroid || Platform.isIOS) {
      String appId = "";

      await getPackageInfo().then((value) {
        appId = value.packageName;
      });

      final url = Uri.parse(
        Platform.isAndroid ? "market://details?id=$appId" : "https://apps.apple.com/id$appId",
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
