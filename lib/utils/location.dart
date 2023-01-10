import 'package:healersandteachers/utils/text_data_check.dart';
import 'package:healersandteachers/utils/toCapitalized.dart';

String locationString(
    {required String city, required String state, required String country}) {
  String location = "";

  if (CheckData.isNotNull(city)) {
    location = city.toCapitalize();
  }
  if (CheckData.isNotNull(state)) {
    location = "$location, ${state.toCapitalize()}";
  }
  if (CheckData.isNotNull(country)) {
    location = "$location, ${country.toCapitalize()}";
  }
  return location;
}
