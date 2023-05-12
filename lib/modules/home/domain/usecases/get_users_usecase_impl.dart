import 'package:app_flutter/modules/home/domain/repositories/get_users_repository.dart';
import 'package:app_flutter/modules/shared/response/response.dart';

import 'get_users_usecase.dart';

class GetUsersUseCaseImpl implements GetUsersUseCase {
  GetUsersUseCaseImpl(this._getUsersRepository);

  final GetUsersRepository _getUsersRepository;

  @override
  Future<ResponsePresentation> getUsers() async {
    try {
      var res = await _getUsersRepository.getUsers();
      return ResponsePresentation(success: true, body: res);
    } catch (e) {
      return ResponsePresentation(success: false, message: e.toString());
    }
  }
}
