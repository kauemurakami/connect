import 'package:connect/app/modules/splash/splash_page.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:connect/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: appTheme,
        defaultTransition: Transition.fade,
        getPages: AppPages.pages,
        home: SplashPage(),
    )
  );
}