import 'package:fans/moduls/Home/home/home_screen.dart';
import 'package:fans/moduls/Home/home/my_posts_screen.dart';
import 'package:fans/moduls/Home/home_structure.dart';
import 'package:fans/moduls/Home/notification/View/dashboard_screen.dart';
import 'package:fans/moduls/splash_screen.dart';
import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/string_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'moduls/Home/notification/View/edit_page_screen.dart';
import 'moduls/Home/notification/View/may_page_screen.dart';


final getPreference = GetStorage();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      // initialBinding: AppBinding(),
      theme: ThemeData(
          accentColor: colorPrimary,
          scaffoldBackgroundColor: colorWhite,
          fontFamily: 'Inter',
          colorScheme: ThemeData().colorScheme.copyWith(primary: colorPrimary),
          unselectedWidgetColor: colorGrey,
          backgroundColor: colorWhite,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent
          // primarySwatch: Colors.blue,
          ),
      builder: (context, widget) => ResponsiveWrapper.builder(BouncingScrollWrapper.builder(context, widget!),
          maxWidth: MediaQuery.of(context).size.width,
          minWidth: 420,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(420, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: colorWhite)),
      home: const MyPageScreen(),
    );
  }
}
