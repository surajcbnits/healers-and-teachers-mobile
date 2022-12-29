import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:healersandteachers/helper/api_helper.dart';

import '../model/pracitioners_model.dart';

class PractitionersProvider extends ChangeNotifier {
  PractitionersDataModel? _practitioners;
  PractitionersDataModel get practitionersData => _practitioners!;

  /// Fetches the list of [PractitionersDataModel] from the API
  Future<void> fetchPractitionersList({int limit = 5, int offset = 0}) async {
    try {
      final response = await ApiHelper.getData(
        url: "/getAllMembersList",
        query: {"limit": limit, "offset": offset},
      );
      log(response.toString());
      if (response!.statusCode == 200) {
        _practitioners = PractitionersDataModel.fromJson(response.data);
        notifyListeners();
      }
    } catch (error) {
      throw (error);
    }
  }

  /// Fetches the single practitioner data from the API
  Future<PractitionersModel?> fetchPractitioners(String username) async {
    try {
      final response = await ApiHelper.getData(
        url: "/getMemberDetail",
        query: {"username": username},
      );
      log(response.toString());
      if (response!.statusCode == 200) {
        return PractitionersModel.fromJson(response.data['data']);
      }
      return null;
    } catch (error) {
      throw (error);
    }
  }
}
