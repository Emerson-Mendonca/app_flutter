import 'package:get/get.dart';

import 'package:app_flutter/app/modules/initial/controllers/initial_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InitialController());
  }
}
