// ignore_for_file: library_private_types_in_public_api

import 'package:app_flutter/core/theme/controllers/theme_controller.dart';
import 'package:app_flutter/modules/home/ui/components/user_post_widgets/list_user_post_page.dart';
import 'package:app_flutter/modules/home/ui/components/user_story_widgets/list_user_story_widget.dart';
import 'package:app_flutter/modules/home/ui/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  final HomeController controller;
  const HomeView(
    this.controller, {
    Key? key,
  }) : super(key: key);

  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverAppBar(
                floating: true,
                pinned: false,
                snap: false,
                stretch: false,
                elevation: 0.9,
                scrolledUnderElevation: 0.9,
                title: const Align(
                  child: Text(
                    "Meu app",
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.camera_alt_outlined),
                  onPressed: () => debugPrint("TAP"),
                ),
                actions: <Widget>[
                  GetBuilder<ThemeController>(
                    builder: (themeController) => Switch(
                      value: themeController.isLightTheme.value,
                      onChanged: (val) {
                        themeController.isLightTheme.value = val;
                        Get.changeThemeMode(
                          themeController.isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                        );
                        themeController.saveThemeStatus();
                      },
                    ),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(100),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: LayoutBuilder(builder: (_, constraints) {
                          return Get.find<ListUserStoryWidget>();
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: LayoutBuilder(builder: (_, constraints) {
                  return Get.find<ListUserPostPage>();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
