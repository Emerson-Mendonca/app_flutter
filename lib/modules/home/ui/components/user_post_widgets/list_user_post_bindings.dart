import 'package:app_flutter/modules/home/ui/components/user_post_widgets/list_user_post_controller.dart';
import 'package:get/get.dart';

class ListUserBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ListUserPostController());
  }
}
