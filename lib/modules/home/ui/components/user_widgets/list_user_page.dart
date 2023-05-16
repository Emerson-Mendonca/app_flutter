import 'package:app_flutter/core/data/model/post_model.dart';
import 'package:app_flutter/core/data/model/user_model.dart';
import 'package:app_flutter/modules/shared/widgets/reusable_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import './list_user_controller.dart';

class ListUserPage extends StatefulWidget {
  final ListUserController controller;
  const ListUserPage(
    this.controller, {
    Key? key,
  }) : super(key: key);

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    final ListUserController controller = widget.controller;
    return widget.controller.obx(
      (state) => ListView.builder(
        itemCount: state.length,
        itemBuilder: (_, index) {
          final PostModel itemPost = state[index];
          final UserModel? itemUser = itemPost.users;
          return Container(
            margin: const EdgeInsets.only(top: 12, bottom: 3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  thickness: 0,
                  indent: 10,
                  endIndent: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: itemUser!.avatar,
                        ).image,
                        radius: 20,
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              itemPost.username,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      const Icon(
                        Icons.more_vert,
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: itemPost.imagePost,
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: itemPost.image,
                    ),
                  ),
                ),
                Visibility(
                  visible: itemPost.imagePost == false,
                  child: Column(
                    children: [
                      const Divider(
                        thickness: 0,
                        indent: 10,
                        endIndent: 10,
                      ),
                      SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, left: 12),
                            child: Column(
                              children: [
                                Text(
                                  itemPost.title,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Expanded(
                                  child: Text(
                                    itemPost.body,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ReusableGlobalWidget().openBottomComment(comment: controller.findCommentAll(postId: itemPost.id, userId: itemPost.userId));
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.comment,
                          ),
                          Text(
                            "Comment",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
      onLoading: const Center(child: CircularProgressIndicator()),
      onError: (error) => const Center(
        child: Text(
          'Error: ao carregar os dados',
          style: TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
