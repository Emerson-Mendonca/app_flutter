import 'package:app_flutter/core/data/model/user_model.dart';
import 'package:app_flutter/core/utils/DebugLog.dart';
import 'package:get/get.dart';

var debugLog = DebugLog();

class UserProvider extends GetConnect {
  Future<List<UserModel>> findUserAll() async {
    final response = await get("https://639091b30bf398c73a8bfa13.mockapi.io/api/v1/users", decoder: (body) {
      if (body != null) {
        return body.map<UserModel>((resp) => UserModel.fromMap(resp)).toList();
      } else {
        return null;
      }
    });
    if (response.hasError) {
      debugLog.error(response);
      return Future.error(Exception(response.hasError));
    }
    debugLog.d(response);
    return response.body;
  }

  Future<UserModel?> findUser(String userId) async {
    final response = await get("https://639091b30bf398c73a8bfa13.mockapi.io/api/v1/users/$userId", decoder: (body) => UserModel.fromMap(body));
    if (response.hasError) {
      debugLog.error(response);
      return Future.error(Exception(response.hasError));
    }
    debugLog.d(response);
    return response.body;
  }
}
