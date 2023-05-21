// coverage:ignore-line to ignore one line.
// coverage:ignore-start and // coverage:ignore-end to ignore range of lines inclusive.
// coverage:ignore-file to ignore the whole file.
import 'package:app_flutter/core/routes/app_pages.dart';
import 'package:app_flutter/core/theme/material-theme/color_schemes.g.dart';
import 'package:app_flutter/modules/shared/bindings/initial_binding.dart';
import 'package:dog/dog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  dog.level = Level.all;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme, fontFamily: 'Roboto'),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme, fontFamily: 'Roboto'),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
    ),
  );
}
