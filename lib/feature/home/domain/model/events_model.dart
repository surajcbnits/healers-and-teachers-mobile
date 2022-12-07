import 'package:healersandteachers/feature/home/domain/model/user_model.dart';

class EventModel {
  String imageUrl;
  String title;
  // String description;
  DateTime dateTime;
  String location;
  UserModel eventBy;
  bool isVirtual;

  EventModel({
    required this.imageUrl,
    required this.title,
    // required this.description,
    required this.dateTime,
    required this.location,
    required this.eventBy,
    required this.isVirtual,
  });
}

List<EventModel> eventsList = [
  EventModel(
    imageUrl:
        "https://images.unsplash.com/photo-1545205597-3d9d02c29597?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    title: "1 Hours Yoga Guide",
    dateTime: DateTime.now().add(const Duration(days: 2)),
    location: "New York",
    eventBy: user,
    isVirtual: true,
  ),
  EventModel(
    imageUrl:
        "https://images.unsplash.com/photo-1603988363607-e1e4a66962c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
    title: "4 Day Myofascial Relaxations",
    dateTime: DateTime.now().add(const Duration(days: 3)),
    location: "New York",
    eventBy: UserModel(
        name: "Xolani Yeboah",
        profileImage:
            "https://images.unsplash.com/photo-1619895862022-09114b41f16f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"),
    isVirtual: true,
  ),
  EventModel(
    imageUrl:
        "https://images.unsplash.com/photo-1621352404112-58e2468993a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fHdvbWVuJTIwZW1wb3dlcm1lbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    title: "4 Day Women's Self-Care",
    dateTime: DateTime.now().add(const Duration(days: 8)),
    location: "New York",
    eventBy: UserModel(
        name: "Xolani Yeboah",
        profileImage:
            "https://images.unsplash.com/photo-1619895862022-09114b41f16f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"),
    isVirtual: false,
  ),
  EventModel(
    imageUrl:
        "https://images.unsplash.com/photo-1603988363607-e1e4a66962c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
    title: "4 Day Women's Self-Care",
    dateTime: DateTime.now().add(const Duration(days: 8)),
    location: "New York",
    eventBy: user,
    isVirtual: false,
  ),
];
