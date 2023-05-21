import 'package:app_flutter/modules/home/domain/repositories/get_users_repository.dart';
import 'package:app_flutter/modules/home/domain/usecases/get_users_usecase_impl.dart';
import 'package:app_flutter/modules/home/external/datasources/get_users_datasource_impl.dart';
import 'package:app_flutter/modules/home/infra/datasources/get_users_datasource.dart';
import 'package:app_flutter/modules/home/infra/repositories/get_users_repository_impl.dart';
import 'package:app_flutter/modules/home/ui/components/user_post_widgets/list_user_post_controller.dart';
import 'package:app_flutter/modules/home/ui/components/user_post_widgets/list_user_post_page.dart';
import 'package:app_flutter/modules/home/ui/components/user_story_widgets/list_user_story_widget.dart';
import 'package:app_flutter/modules/home/ui/controllers/home_controller.dart';
import 'package:app_flutter/modules/shared/http/http_client.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListUserStoryWidget>(() => ListUserStoryWidget(Get.find()));
    Get.lazyPut<ListUserPostPage>(() => ListUserPostPage(Get.find()));
    Get.lazyPut<ListUserPostController>(() => ListUserPostController());
    Get.lazyPut<GetUsersDataSource>(() => GetUsersDataSourceImpl(Get.find<HttpClientAdapterDio>()));
    Get.lazyPut<GetUsersRepository>(() => GetUsersRepositoryImpl(Get.find<GetUsersDataSource>()));
    Get.lazyPut(() => GetUsersUseCaseImpl(Get.find<GetUsersRepository>()));
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
