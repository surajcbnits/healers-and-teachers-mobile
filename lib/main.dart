import 'package:flutter/material.dart';
import 'package:healersandteachers/constant/app_color.dart';
import 'package:healersandteachers/feature/events/Provider/events_provider.dart';
import 'package:healersandteachers/helper/api_helper.dart';
import 'package:healersandteachers/helper/text_style.dart';
import 'package:provider/provider.dart';

import 'config/routes/routes.dart';
import 'feature/categories/provider/categories_provider.dart';
import 'feature/home/view/main_bottom_screen.dart';
import 'feature/paractitioners/providers/paractitioners_provider.dart';
import 'feature/services/provider/service_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PractitionersProvider()),
        ChangeNotifierProvider(create: (context) => EventProvider()),
        ChangeNotifierProvider(create: (context) => ServiceProvider()),
        ChangeNotifierProvider(create: (context) => CategoriesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Healer and Teacher',
        theme: appTheme(),
        home: const MainBottomScreen(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      fontFamily: "Proxima Nova",
      // scrollbarTheme: ScrollbarThemeData(
      //   interactive: true,
      //   thumbColor: MaterialStateProperty.all(AppColor.primaryColor),
      //   trackVisibility: MaterialStateProperty.all(true),
      //   trackColor: MaterialStateProperty.resolveWith((states) => Colors.grey),
      // ),
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
