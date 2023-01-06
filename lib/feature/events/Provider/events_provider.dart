import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/events/model/events_model.dart';

import '../../../helper/api_helper.dart';

class EventProvider extends ChangeNotifier {
  EventDetailsDataModel? _eventsData;
  EventDetailsDataModel get eventsData => _eventsData!;
  List<EventDetails> _events = [];
  List<EventDetails> get eventsList => _events;

  /// Fetches the list of [EventDetailsDataModel] from the API
  Future<EventDetailsDataModel> _getEvents(String username) async {
    try {
      final response = await ApiHelper.getData(
        url: "/getMemberEventsByUser",
        query: {"username": username},
      );
      log(response.toString());
      if (response!.statusCode == 200) {
        EventDetailsDataModel data =
            EventDetailsDataModel.fromJson(response.data);
        return data;
      }
      return EventDetailsDataModel();
    } catch (error) {
      throw (error);
    }
  }

  Future<EventDetailsDataModel> _getEventList(
      {int limit = 10, int offset = 0}) async {
    try {
      final response = await ApiHelper.getData(
        url: "/getAllMemberEventList",
        query: {"limit": limit, "offset": offset},
      );
      log(response.toString());
      if (response!.statusCode == 200) {
        EventDetailsDataModel data =
            EventDetailsDataModel.fromJson(response.data);
        return data;
      }
      return EventDetailsDataModel();
    } catch (error) {
      throw (error);
    }
  }

  Future<List<EventDetails>?> fetchUserEvents(String username) async {
    try {
      final events = await _getEvents(username);
      // _events = events.eventData!;
      notifyListeners();
      return events.eventDataList!;
    } catch (e) {
      print(e);
    }
  }

  Future<List<EventDetails>?> fetchAllEventsList(
      {int limit = 5, int offset = 0, bool clearData = false}) async {
    try {
      final events = await _getEventList(limit: limit, offset: offset);

      if (clearData) _events.clear();

      _eventsData = events;
      _events.addAll(events.eventDataList!);
      notifyListeners();
      return events.eventDataList!;
    } catch (e) {
      print(e);
    }
  }
}
