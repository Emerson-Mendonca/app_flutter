import 'package:app_flutter/app/modules/home/ui/components/user_widgets/list_user_controller.dart'
    show ListUserController;
import 'package:get/get.dart';

class ListUserBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ListUserController());
  }
}
