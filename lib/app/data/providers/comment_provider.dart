import 'package:get/get.dart';

import 'package:app_flutter/app/data/model/comment_model.dart';
import 'package:app_flutter/app/utils/DebugLog.dart';

var debugLog = DebugLog();

class CommentProvider extends GetConnect {
  Future<List<CommentModel>?> findCommentAll(
      String userId, String postId) async {
    final response = await get(
        "https://639091b30bf398c73a8bfa13.mockapi.io/api/v1/users/$userId/post/$postId/comments",
        decoder: (body) {
      if (body is List) {
        return body
            .map<CommentModel>((resp) => CommentModel.fromMap(resp))
            .toList();
      } else {
        return null;
      }
    });

    if (response.status.hasError) {
      debugLog.error(response);
      return Future.error(Exception(response.statusText));
    }
    debugLog.d(response);
    return response.body;
  }

  Future<CommentModel?> findComment(
      String userId, String postId, String commentsId) async {
    final response = await get(
        "https://639091b30bf398c73a8bfa13.mockapi.io/api/v1/users/$userId/post/$postId/comments/$commentsId",
        decoder: (body) => CommentModel.fromMap(body));
    if (response.status.hasError) {
      debugLog.error(response);
      return Future.error(Exception(response.statusText));
    }
    debugLog.d(response);
    return response.body;
  }
}
