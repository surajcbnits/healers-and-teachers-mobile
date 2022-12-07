import 'package:flutter/material.dart';
import 'package:healersandteachers/constant/app_color.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primaryColor,
          primary: AppColor.primaryColor,
          secondary: AppColor.secondaryColor,
        ),
      ),
      home: const MainBottomScreen(),
    );
  }
}
