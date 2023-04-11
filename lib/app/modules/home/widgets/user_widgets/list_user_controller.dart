import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:app_flutter/app/data/model/comment_model.dart';
import 'package:app_flutter/app/data/providers/comment_provider.dart';
import 'package:app_flutter/app/data/providers/post_provider.dart';
import 'package:app_flutter/app/widgets/reusable_global_widget.dart';

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

  Future<List<CommentModel>?> findCommentAll(
      {required String userId, required String postId}) async {
    try {
      List<CommentModel>? commentModelResponse =
          await _apiCommentProvider.findCommentAll(userId, postId);
      return commentModelResponse;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<CommentModel?> findComment({
    required String userId,
    required String postId,
    required String commentsId,
  }) async {
    try {
      CommentModel? commentModelResponse =
          await _apiCommentProvider.findComment(userId, postId, commentsId);
      return commentModelResponse;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}