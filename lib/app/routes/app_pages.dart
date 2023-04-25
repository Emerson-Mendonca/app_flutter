// ignore_for_file: constant_identifier_names


import 'package:app_flutter/app/modules/home/ui/bindings/home_binding.dart';
import 'package:app_flutter/app/modules/home/ui/pages/home_view.dart';



import 'package:app_flutter/app/modules/initial/bindings/initial_binding.dart';
import 'package:app_flutter/app/modules/initial/views/initial_view.dart';
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
    ),
  ];
}
