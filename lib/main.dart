import 'package:flutter/material.dart';
import 'package:healersandteachers/constant/app_color.dart';
import 'package:healersandteachers/helper/text_style.dart';

import 'config/routes/routes.dart';
import 'feature/home/screen/main_bottom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healer and Teacher',
      theme: appTheme(),
      home: const MainBottomScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      fontFamily: "Proxima Nova",
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.primaryColor,
        primary: AppColor.primaryColor,
        secondary: AppColor.secondaryColor,
      ),
      scaffoldBackgroundColor: AppColor.white,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.black),
        titleTextStyle: TextStyleHelper.t24b700(),
        centerTitle: true,
      ),
    );
  }
}
