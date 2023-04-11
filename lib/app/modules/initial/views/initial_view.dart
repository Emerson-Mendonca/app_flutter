import 'package:app_flutter/app/modules/initial/controllers/initial_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InitialView extends GetView<InitialController> {
  const InitialView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/image/logo-flutter.png"),
              const CircularProgressIndicator(),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: const Text(
                  "Getx",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.purple,
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
