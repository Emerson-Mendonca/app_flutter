import 'package:app_flutter/app/shared/http/http_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => HttpClientAdapterDio(dio: Get.find()));
  }
}
