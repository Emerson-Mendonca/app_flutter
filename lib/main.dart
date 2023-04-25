// coverage:ignore-line to ignore one line.
// coverage:ignore-start and // coverage:ignore-end to ignore range of lines inclusive.
// coverage:ignore-file to ignore the whole file.
import 'package:app_flutter/app/shared/bindings/initial_binding.dart';
import 'package:dog/dog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  dog.level = Level.all;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
    ),
  );
}
