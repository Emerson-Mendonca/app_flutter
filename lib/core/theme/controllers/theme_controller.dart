import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController with StateMixin {
  @override
  void onInit() async {
    getThemeStatus();
    super.onInit();
  }

  final RxBool isLightTheme = false.obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', isLightTheme.value);
    update();
  }

  getThemeStatus() async {
    var isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    }).obs;
    isLightTheme.value = await isLight.value;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }
}
