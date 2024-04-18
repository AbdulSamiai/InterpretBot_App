import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/mySize.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/views/login/login_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetMaterialApp(
      title: 'Interpret Bot APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Palette.palette1,
        scaffoldBackgroundColor: ThemeColors.bgColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: ThemeColors.mainColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: ThemeColors.bgColor,
          ),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: ThemeColors.bgColor,
          ),
        ),
      ),
      home: LoginView(),
    );
  }
}
