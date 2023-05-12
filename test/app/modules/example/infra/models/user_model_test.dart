import 'package:app_flutter/modules/home/infra/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_users_usecase_mock.dart';

void main() {
  group('- Get Method', () {
    testWidgets('Testa o UserModel', (tester) async {
      UserModel userModel = UserModel.fromMap(mock);
      UserModel userModelString = UserModel.fromJson(mockString);

      expect(userModel.toMap(), isA<Map<String, dynamic>>());
      expect(userModel.toJson(), isA<String>());
      expect(userModel.toJson(), isA<String>());
      expect(userModelString.toJson(), isA<String>());
    });
  });
}
