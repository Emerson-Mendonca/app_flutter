import 'package:app_flutter/modules/shared/response/response.dart';

abstract class GetUsersUseCase {
  Future<ResponsePresentation> getUsers();
}
