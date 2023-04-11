import 'package:get/get.dart';

import 'package:app_flutter/app/modules/home/widgets/user_widgets/list_user_controller.dart';
import 'package:app_flutter/app/modules/home/widgets/user_widgets/list_user_page.dart';

import 'package:app_flutter/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListUserPage>(() => ListUserPage(Get.find()));
    Get.lazyPut<ListUserController>(() => ListUserController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
