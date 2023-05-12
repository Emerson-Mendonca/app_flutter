import 'package:app_flutter/core/data/model/post_model.dart';
import 'package:app_flutter/core/utils/DebugLog.dart';
import 'package:get/get.dart';

var debugLog = DebugLog();

class PostProvider extends GetConnect {
  Future<List<PostModel>?> findPostAll() async {
    final response = await get("https://639091b30bf398c73a8bfa13.mockapi.io/api/v1/post", decoder: (body) {
      return body.map<PostModel>((resp) => PostModel.fromMap(resp)).toList();
    });
    if (response.hasError) {
      debugLog.error(response);
      return Future.error(Exception(response.hasError));
    }
    debugLog.d(response);
    return response.body;
  }

  Future<List<PostModel>?> findPost(String userId, String postId) async {
    final response = await get("https://639091b30bf398c73a8bfa13.mockapi.io/api/v1/users/$userId/post/$postId", decoder: (body) {
      return body.map<PostModel>((resp) => PostModel.fromMap(resp)).toList();
    });
    if (response.hasError) {
      debugLog.error(response);
      return Future.error(Exception(response.hasError));
    }
    debugLog.d(response);
    return response.body;
  }
}
