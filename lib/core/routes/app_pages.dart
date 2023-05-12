// ignore_for_file: constant_identifier_names

import 'package:app_flutter/modules/home/ui/bindings/home_binding.dart';
import 'package:app_flutter/modules/home/ui/pages/home_view.dart';
import 'package:app_flutter/modules/initial/bindings/initial_binding.dart';
import 'package:app_flutter/modules/initial/views/initial_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: _Paths.INITIAL,
      page: () => const InitialView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(Get.find()),
      binding: HomeBinding(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
  ];
}
