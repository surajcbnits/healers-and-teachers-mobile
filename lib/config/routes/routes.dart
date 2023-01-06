import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/location/view/locartion.dart';

import '../../feature/booking/view/booking_screen.dart';
import '../../feature/categories/model/categories_model.dart';
import '../../feature/categories/view/categories_screen/categories_screen.dart';
import '../../feature/categories/view/categories_detail/categories_detail_screen.dart';
import '../../feature/events/view/event_detail_screen/event_detail_screen.dart';
import '../../feature/events/model/events_model.dart';
import '../../feature/events/view/event_screen/events_screen.dart';
import '../../feature/home/view/home_screen.dart';
import '../../feature/home/view/main_bottom_screen.dart';
import '../../feature/paractitioners/model/pracitioners_model.dart';
import '../../feature/paractitioners/view/practitioner_screen/practitioners_screen.dart';
import '../../feature/paractitioners/view/practitioner_profile/practitioner_profile_screen.dart';

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
                    practitionerData: settings.arguments as MemberDetails,
                  ));
        }
        return _errorRoute(errorText: "dataErrorInRoute");
      case Routes.categoriesDetailScreen:
        if (settings.arguments != null) {
          return MaterialPageRoute(
              builder: (context) => CategoriesDetailScreen(
                    categoryData: settings.arguments as CategoriesDataModel,
                  ));
        }
        return _errorRoute(errorText: "dataErrorInRoute");
      case Routes.eventDetailScreen:
        if (settings.arguments != null) {
          return MaterialPageRoute(
              builder: (context) => EventDetailScreen(
                    eventData: settings.arguments as EventDetails,
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
