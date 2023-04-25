import 'package:app_flutter/app/shared/response/response.dart';

abstract class GetUsersUseCase {
  Future<ResponsePresentation> getUsers();
}
