// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_flutter/core/data/model/comment_model.dart';
import 'package:app_flutter/core/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class ReusableGlobalWidget {
  ReusableGlobalWidget();

  Future openBottomSheet({
    required String textStyle,
    required String textTitulo,
  }) {
    return Get.bottomSheet(
      Container(
        height: 150,
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          children: [
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 15)),
                Text(
                  textTitulo,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  textStyle,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 16)),
                OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      width: 2.0,
                      color: Colors.blue,
                    ),
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      //isDismissible: false,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  Future openBottomComment(
    BuildContext context, {
    required Future<List<CommentModel>?> comment,
  }) {
    return Get.bottomSheet(
      FutureBuilder(
          future: comment,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                height: 350,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 350,
                      width: double.infinity,
                      child: Scrollbar(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              final CommentModel itemComment = snapshot.data[index];
                              final UserModel itemUser = itemComment.user;
                              return Container(
                                margin: const EdgeInsets.only(top: 12, bottom: 3),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 12, right: 12),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: FadeInImage.memoryNetwork(
                                              placeholder: kTransparentImage,
                                              image: itemUser.avatar,
                                            ).image,
                                            radius: 16,
                                          ),
                                          const SizedBox(
                                            width: 12.0,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  itemUser.name,
                                                  style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.outline),
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
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 12, left: 55, right: 12),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          itemComment.body,
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return const SizedBox(height: 150, child: Center(child: CircularProgressIndicator()));
          }),

      //isDismissible: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }
}
