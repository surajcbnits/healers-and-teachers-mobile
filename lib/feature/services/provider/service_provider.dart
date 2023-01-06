import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../helper/api_helper.dart';
import '../model/services_model.dart';

class ServiceProvider with ChangeNotifier {
  ServiceDataModel? _practitioners;
  ServiceDataModel get practitionersData => _practitioners!;

  /// Fetches the list of [ServiceDataModel] from the API
  Future<ServiceDataModel> _getServiceDataListByUser(String username) async {
    try {
      final response = await ApiHelper.getData(
        url: "/getMemberServicesByUser",
        query: {"username": username},
      );
      log(response.toString());
      if (response!.statusCode == 200) {
        ServiceDataModel data = ServiceDataModel.fromJson(response.data);
        return data;
      }
      return ServiceDataModel();
    } catch (error) {
      throw (error);
    }
  }

  /// Fetches the single practitioner data from the API
  Future<ServiceDataModel?> fetchServiceByUser(String username) async {
    try {
      final response = await _getServiceDataListByUser(username);
      _practitioners = response;
      notifyListeners();
      return response;
    } catch (error) {
      throw (error);
    }
  }
}
