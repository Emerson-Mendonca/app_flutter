

import 'package:app_flutter/app/modules/home/infra/models/user_model.dart';

abstract class GetUsersRepository {
  Future<List<UserModel>> getUsers();
}
