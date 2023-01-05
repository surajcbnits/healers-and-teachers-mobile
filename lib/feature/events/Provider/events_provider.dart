import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/events/model/events_model.dart';

import '../../../helper/api_helper.dart';

class EventProvider extends ChangeNotifier {
  EventDataModel? _eventsData;
  EventDataModel get eventsData => _eventsData!;
  List<EventModel> _events = [];
  List<EventModel> get eventsList => _events;

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

  Future<EventDataModel> _getEventList({int limit = 10, int offset = 0}) async {
    try {
      final response = await ApiHelper.getData(
        url: "/getAllMemberEventList",
        query: {"limit": limit, "offset": offset},
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

  Future<List<EventModel>?> fetchUserEvents(String username) async {
    try {
      final events = await _getEvents(username);
      // _events = events.eventData!;
      notifyListeners();
      return events.eventDataList!;
    } catch (e) {
      print(e);
    }
  }

  Future<List<EventModel>?> fetchAllEventsList(
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
