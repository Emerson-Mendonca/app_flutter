

import 'package:app_flutter/modules/home/infra/models/user_model.dart';

abstract class GetUsersRepository {
  Future<List<UserModel>> getUsers();
}
