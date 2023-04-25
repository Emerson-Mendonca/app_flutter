import 'package:app_flutter/app/modules/home/domain/usecases/get_users_usecase_impl.dart';
import 'package:app_flutter/app/modules/home/infra/datasources/get_users_datasource.dart';
import 'package:app_flutter/app/modules/home/infra/models/user_model.dart';
import 'package:app_flutter/app/modules/home/infra/repositories/get_users_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
import 'get_users_usecase_mock.dart';
@GenerateNiceMocks([MockSpec<GetUsersDataSource>()])
import 'get_users_usecase_test.mocks.dart';

void main() {
  final getUsersDataSource = MockGetUsersDataSource();
  final getUsersRepositoryImpl = GetUsersRepositoryImpl(getUsersDataSource);
  final getUsersUseCaseImpl = GetUsersUseCaseImpl(getUsersRepositoryImpl);

  test('Testar se gera um requisição', () async {
    when(getUsersDataSource.getUsers()).thenAnswer((_) async => mock);

    var res = await getUsersUseCaseImpl.getUsers();
    expect(res.success, isTrue);
    expect(res.body, isA<List<UserModel>>());
  });

  test('Testar se gera um requisição com falha', () async {
    when(getUsersDataSource.getUsers()).thenThrow(Exception("Error: Error"));

    var res = await getUsersUseCaseImpl.getUsers();

    expect(res.success, isFalse);
    expect(res.body, isNull);
    expect(res.message, isA<String>());
  });
}
