import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/location/screen/locartion.dart';

import '../../feature/booking/screen/booking_screen.dart';
import '../../feature/categories/model/categories_model.dart';
import '../../feature/categories/screen/categories_screen.dart';
import '../../feature/categories_detail/screen/categories_detail_screen.dart';
import '../../feature/event_detail_screen/screen/event_detail_screen.dart';
import '../../feature/events/model/events_model.dart';
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
  static const String categoriesDetailScreen = '/categoriesDetailScreen';
  static const String eventDetailScreen = '/eventDetailScreen';
  static const String bookingScreen = '/bookingScreen';
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
        return _errorRoute(errorText: "dataErrorInRoute");
      case Routes.categoriesDetailScreen:
        if (settings.arguments != null) {
          return MaterialPageRoute(
              builder: (context) => CategoriesDetailScreen(
                    categoriesModel: settings.arguments as CategoriesModel,
                  ));
        }
        return _errorRoute(errorText: "dataErrorInRoute");
      case Routes.eventDetailScreen:
        if (settings.arguments != null) {
          return MaterialPageRoute(
              builder: (context) => EventDetailScreen(
                    eventData: settings.arguments as EventModel,
                  ));
        }
        return _errorRoute(errorText: "dataErrorInRoute");
      case Routes.bookingScreen:
        return MaterialPageRoute(builder: (context) => const BookingScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute({String? errorText}) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: Center(
          child: Text(errorText ?? "Something went wrong"),
        ),
      );
    });
  }
}
