import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:healersandteachers/helper/api_helper.dart';

import '../model/pracitioners_model.dart';

class PractitionersProvider extends ChangeNotifier {
  MemberDetailsDataModel? _practitioners;
  MemberDetailsDataModel get practitionersData => _practitioners!;
  List<MemberDetails> memberDataList = [];

  /// Fetches the list of [MemberDetailsDataModel] from the API
  Future<MemberDetailsDataModel> _getPractitionersList(
      {int limit = 10, int offset = 0}) async {
    try {
      final response = await ApiHelper.getData(
        url: "/getAllMembersList",
        query: {"limit": limit, "offset": offset},
      );
      log(response.toString());
      if (response!.statusCode == 200) {
        MemberDetailsDataModel data =
            MemberDetailsDataModel.fromJson(response.data);
        return data;
      }
      return MemberDetailsDataModel();
    } catch (error) {
      throw (error);
    }
  }

  /// Fetches the list of [MemberDetailsDataModel] from the API
  Future<MemberDetailsDataModel> fetchPractitionersList(
      {int limit = 10, int offset = 0}) async {
    try {
      final data = await _getPractitionersList(limit: limit, offset: offset);

      data.practitionerList!
          .sort((a, b) => a.firstName!.compareTo(b.firstName!));
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
  Future<MemberDetails?> fetchPractitioners(String username) async {
    try {
      final response = await ApiHelper.getData(
        url: "/getMemberDetail",
        query: {"username": username},
      );
      log(response.toString());
      if (response!.statusCode == 200) {
        return MemberDetails.fromJson(response.data['data']);
      }
      return null;
    } catch (error) {
      throw (error);
    }
  }

  /// To fetch the data from the API and pagination
  getMemberData({int limit = 5, int offset = 0, bool clearData = false}) async {
    final data = await _getPractitionersList(limit: limit, offset: offset);
    if (clearData) memberDataList.clear();
    // data.practitionerList!.sort((a, b) => a.firstName!.compareTo(b.firstName!));
    memberDataList.addAll(data.practitionerList!);
    notifyListeners();
  }
}
