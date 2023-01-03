import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/events/model/events_model.dart';

import '../../../helper/api_helper.dart';

class EventProvider extends ChangeNotifier {
  // List<EventModel> _events = [];
  // List<EventModel> get events => _events;

  /// Fetches the list of [EventDataModel] from the API
  Future<EventDataModel> _getEvents(String username) async {
    try {
      final response = await ApiHelper.getData(
        url: "/getMemberEventsByUser",
        query: {"username": username},
      );
      log(response.toString());
      if (response!.statusCode == 200) {
        EventDataModel data = EventDataModel.fromJson(response.data);
        return data;
      }
      return EventDataModel();
    } catch (error) {
      throw (error);
    }
  }

  Future<List<EventModel>?> fetchEvents(String username) async {
    try {
      final events = await _getEvents(username);
      // _events = events.eventData!;
      notifyListeners();
      return events.eventData!;
    } catch (e) {
      print(e);
    }
  }
}
