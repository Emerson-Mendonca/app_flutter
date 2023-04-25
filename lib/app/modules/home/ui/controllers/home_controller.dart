import 'package:app_flutter/app/modules/home/domain/usecases/get_users_usecase_impl.dart';
import 'package:app_flutter/app/modules/home/infra/models/user_model.dart';
import 'package:app_flutter/app/widgets/reusable_global_widget.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  final GetUsersUseCaseImpl _getUsersUseCase = Get.find();
  late List<UserModel> userModelResponse;

  @override
  void onInit() {
    super.onInit();
    findUserAll();
  }

  Future<void> findUserAll() async {
    await _getUsersUseCase.getUsers().then((response) {
      userModelResponse = response.body;
      change(response.body, status: RxStatus.success());
    }, onError: (err) {
      ReusableGlobalWidget().openBottomSheet(
          textTitulo: 'Erro', textStyle: 'Ao carregar os dados da API');
      change(null, status: RxStatus.error("Error: $err"));
    });
  }
}
