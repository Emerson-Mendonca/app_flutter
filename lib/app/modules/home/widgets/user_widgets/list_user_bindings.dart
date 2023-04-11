import 'package:get/get.dart';
import 'package:app_flutter/app/modules/home/widgets/user_widgets/list_user_controller.dart' show ListUserController;

class ListUserBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ListUserController());
    }
}