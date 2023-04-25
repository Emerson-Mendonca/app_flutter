import 'package:app_flutter/app/modules/home/domain/repositories/get_users_repository.dart';
import 'package:app_flutter/app/modules/home/domain/usecases/get_users_usecase_impl.dart';
import 'package:app_flutter/app/modules/home/external/datasources/get_users_datasource_impl.dart';
import 'package:app_flutter/app/modules/home/infra/datasources/get_users_datasource.dart';
import 'package:app_flutter/app/modules/home/infra/repositories/get_users_repository_impl.dart';
import 'package:app_flutter/app/modules/home/ui/components/user_widgets/list_user_controller.dart';
import 'package:app_flutter/app/modules/home/ui/components/user_widgets/list_user_page.dart';
import 'package:app_flutter/app/modules/home/ui/controllers/home_controller.dart';
import 'package:app_flutter/app/shared/http/http_client.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListUserPage>(() => ListUserPage(Get.find()));
    Get.lazyPut<ListUserController>(() => ListUserController());
    Get.lazyPut<GetUsersDataSource>(
        () => GetUsersDataSourceImpl(Get.find<HttpClientAdapterDio>()));
    Get.lazyPut<GetUsersRepository>(
        () => GetUsersRepositoryImpl(Get.find<GetUsersDataSource>()));
    Get.lazyPut(() => GetUsersUseCaseImpl(Get.find<GetUsersRepository>()));
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
