import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:app_flutter/app/data/model/user_model.dart';
import 'package:app_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:app_flutter/app/modules/home/widgets/user_widgets/list_user_page.dart';

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
        child: Container(
          color: Colors.grey[900],
          child: Column(
            children: [
              SizedBox(
                height: 96,
                width: MediaQuery.of(context).size.width,
                child: widget.controller.obx(
                  (state) => ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.length,
                      itemBuilder: (_, index) {
                        final UserModel item = state[index];
                        return item.online
                            ? Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    customBorder: const CircleBorder(),
                                    child: Container(
                                      height: 64,
                                      width: 64,
                                      padding: const EdgeInsets.all(2),
                                      margin: const EdgeInsets.only(
                                          left: 12,
                                          right: 12,
                                          top: 15,
                                          bottom: 3),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        gradient: const LinearGradient(
                                          colors: [Colors.purple, Colors.blue],
                                          begin: Alignment(-1, -1),
                                          end: Alignment(2, 2),
                                        ),
                                      ),
                                      child: Center(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Container(
                                            height: 58,
                                            width: 58,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              image: DecorationImage(
                                                image:
                                                    FadeInImage.memoryNetwork(
                                                  placeholder:
                                                      kTransparentImage,
                                                  image: item.avatar,
                                                ).image,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    item.name,
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      print("TAP");
                                    },
                                    child: Container(
                                      height: 64,
                                      width: 64,
                                      padding: const EdgeInsets.all(2),
                                      margin: const EdgeInsets.only(
                                          left: 12,
                                          right: 12,
                                          top: 15,
                                          bottom: 3),
                                      child: Center(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Container(
                                            height: 58,
                                            width: 58,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              image: DecorationImage(
                                                image:
                                                    FadeInImage.memoryNetwork(
                                                  placeholder:
                                                      kTransparentImage,
                                                  image: item.avatar,
                                                ).image,
                                                fit: BoxFit.fitHeight,
                                              ), //By deleting the image here, you can only use it text.
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    item.name,
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              );
                      }),
                  onLoading: const Center(child: CircularProgressIndicator()),
                  onError: (error) => const Center(
                    child: Text(
                      'Error: ao carregar os dados',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(1),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.black,
                    child: LayoutBuilder(builder: (_, constraints) {
                      return Get.find<ListUserPage>();
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}