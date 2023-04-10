
import 'package:get/get.dart';

import 'package:app_flutter/app/data/model/user_model.dart';
import 'package:app_flutter/app/data/providers/user_provider.dart';
import 'package:app_flutter/app/widgets/reusable_global_widget.dart';

class HomeController extends GetxController with StateMixin {
  final UserProvider _apiUserProvider = UserProvider();
  late List<UserModel> userModelResponse;

  @override
  void onInit() {
    super.onInit();
    findUserAll();
  }

  Future<void> findUserAll() async {
    _apiUserProvider.findUserAll().then((response) {
      userModelResponse = response;
      change(response, status: RxStatus.success());
    }, onError: (err) {
      ReusableGlobalWidget().openBottomSheet(
          textTitulo: 'Erro', textStyle: 'Ao carregar os dados da API');
      change(null, status: RxStatus.error("Error: $err"));
    });
  }
}
