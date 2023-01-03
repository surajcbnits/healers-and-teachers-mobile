import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:healersandteachers/helper/api_helper.dart';

import '../model/pracitioners_model.dart';

class PractitionersProvider extends ChangeNotifier {
  PractitionersDataModel? _practitioners;
  PractitionersDataModel get practitionersData => _practitioners!;
  List<PractitionersModel> memberDataList = [];

  /// Fetches the list of [PractitionersDataModel] from the API
  Future<PractitionersDataModel> _getPractitionersList(
      {int limit = 10, int offset = 0}) async {
    try {
      final response = await ApiHelper.getData(
        url: "/getAllMembersList",
        query: {"limit": limit, "offset": offset},
      );
      log(response.toString());
      if (response!.statusCode == 200) {
        PractitionersDataModel data =
            PractitionersDataModel.fromJson(response.data);
        return data;
      }
      return PractitionersDataModel();
    } catch (error) {
      throw (error);
    }
  }

  /// Fetches the list of [PractitionersDataModel] from the API
  Future<PractitionersDataModel> fetchPractitionersList(
      {int limit = 10, int offset = 0}) async {
    try {
      final data = await _getPractitionersList(limit: limit, offset: offset);

      _practitioners = data;
      notifyListeners();
      return data;
      // }
      // return PractitionersDataModel();
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

  /// To fetch the data from the API and pagination
  getMemberData(
      {int limit = 10, int offset = 0, bool clearData = false}) async {
    final data = await _getPractitionersList(limit: limit, offset: offset);
    if (clearData) memberDataList.clear();
    memberDataList.addAll(data.practitionerList!);
    notifyListeners();
  }
}
