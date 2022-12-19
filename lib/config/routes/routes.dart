import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/location/screen/locartion.dart';

import '../../feature/categories/screen/categories_screen.dart';
import '../../feature/events/screen/events_screen.dart';
import '../../feature/home/screen/home_screen.dart';
import '../../feature/home/screen/main_bottom_screen.dart';
import '../../feature/paractitioners/model/pracitioners_model.dart';
import '../../feature/paractitioners/screen/practitioners_screen.dart';
import '../../feature/practitionerProfile/screen/practitioner_profile_screen.dart';

class Routes {
  Routes._();
  static const String homeScreen = '/homeScreen';
  static const String mainBottomNav = '/mainBottomNav';
  static const String changeLocationScreen = '/changeLocationScreen';
  static const String categoriesScreen = '/categoriesScreen';
  static const String practitionerScreen = '/practitionerScreen';
  static const String eventScreen = '/eventScreen';
  static const String practitionerProfileScreen = '/practitionerProfileScreen';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arrg = settings.arguments;
    switch (settings.name) {
      case Routes.mainBottomNav:
        return MaterialPageRoute(
            builder: (context) => const MainBottomScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.changeLocationScreen:
        return MaterialPageRoute(
            builder: (context) => const ChangeLocationScreen());
      case Routes.categoriesScreen:
        return MaterialPageRoute(
            builder: (context) => const CategoriesScreen());
      case Routes.practitionerScreen:
        return MaterialPageRoute(
            builder: (context) => const PractitionerScreen());
      case Routes.eventScreen:
        return MaterialPageRoute(builder: (context) => const EventScreen());
      case Routes.practitionerProfileScreen:
        if (settings.arguments != null) {
          return MaterialPageRoute(
              builder: (context) => PractitionerProfileScreen(
                    practitionerData: settings.arguments as PractitionersModel,
                  ));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(
          child: Text("Somthing went wrong"),
        ),
      );
    });
  }
}
