import 'package:app_flutter/core/theme/controllers/theme_controller.dart';
import 'package:app_flutter/modules/initial/controllers/initial_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController(), permanent: true);
    Get.put(InitialController());
  }
}
