import 'package:app_flutter/core/data/model/comment_model.dart';
import 'package:app_flutter/core/data/providers/comment_provider.dart';
import 'package:app_flutter/core/data/providers/post_provider.dart';
import 'package:app_flutter/modules/shared/widgets/reusable_global_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ListUserController extends GetxController with StateMixin {
  final PostProvider _apiProviderPost = PostProvider();
  final CommentProvider _apiCommentProvider = CommentProvider();

  @override
  void onInit() {
    super.onInit();
    findPostAll();
  }

  Future<void> findPostAll() async {
    _apiProviderPost.findPostAll().then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(
          ReusableGlobalWidget().openBottomSheet(
            textTitulo: 'Erro',
            textStyle: 'Ao carregar os dados da API',
          ),
          status: RxStatus.error(err.toString()));
    });
  }

  Future<List<CommentModel>?> findCommentAll({required String userId, required String postId}) async {
    try {
      List<CommentModel>? commentModelResponse = await _apiCommentProvider.findCommentAll(userId, postId);
      return commentModelResponse;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<List<CommentModel>?> findComment({
    required String userId,
    required String postId,
    required String commentsId,
  }) async {
    try {
      List<CommentModel>? commentModelResponse = await _apiCommentProvider.findComment(userId, postId, commentsId);
      return commentModelResponse;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
