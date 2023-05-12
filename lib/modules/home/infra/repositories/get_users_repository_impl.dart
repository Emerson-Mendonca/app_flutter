import 'package:app_flutter/modules/home/domain/repositories/get_users_repository.dart';
import 'package:app_flutter/modules/home/infra/datasources/get_users_datasource.dart';
import 'package:app_flutter/modules/home/infra/models/user_model.dart';

class GetUsersRepositoryImpl implements GetUsersRepository {
  GetUsersRepositoryImpl(this._getUsersDataSource);

  final GetUsersDataSource _getUsersDataSource;

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      var res = await _getUsersDataSource.getUsers();
      return res.map((e) => UserModel.fromMap(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
