import 'package:healersandteachers/feature/home/domain/model/user_model.dart';

class EventModelTemp {
  String imageUrl;
  String title;
  // String description;
  DateTime dateTime;
  String location;
  UserModel eventBy;
  bool isVirtual;

  EventModelTemp({
    required this.imageUrl,
    required this.title,
    // required this.description,
    required this.dateTime,
    required this.location,
    required this.eventBy,
    required this.isVirtual,
  });
}

class EventDataModel {
  List<EventModel>? eventData;

  EventDataModel({this.eventData});

  EventDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      eventData = <EventModel>[];
      json['data'].forEach((v) {
        eventData!.add(new EventModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eventData != null) {
      data['data'] = this.eventData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventModel {
  int? id;
  String? name;
  String? image;
  String? description;
  String? startdatetime;
  String? enddatetime;
  String? type;
  String? city;
  String? state;
  String? country;
  String? link;
  String? feetype;
  int? slidingscalemin;
  int? slidingscalemax;
  dynamic? feepersession;
  String? recurring;
  String? recurringschedule;
  String? eventstatus;
  String? createdAt;
  String? updatedAt;
  int? memberId;
  List<WellnessKeywords>? wellnessKeywords;

  EventModel(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.startdatetime,
      this.enddatetime,
      this.type,
      this.city,
      this.state,
      this.country,
      this.link,
      this.feetype,
      this.slidingscalemin,
      this.slidingscalemax,
      this.feepersession,
      this.recurring,
      this.recurringschedule,
      this.eventstatus,
      this.createdAt,
      this.updatedAt,
      this.memberId,
      this.wellnessKeywords});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    startdatetime = json['startdatetime'];
    enddatetime = json['enddatetime'];
    type = json['type'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    link = json['link'];
    feetype = json['feetype'];
    slidingscalemin = json['slidingscalemin'];
    slidingscalemax = json['slidingscalemax'];
    feepersession = json['feepersession'];
    recurring = json['recurring'];
    recurringschedule = json['recurringschedule'];
    eventstatus = json['eventstatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    memberId = json['MemberId'];
    if (json['wellnessKeywords'] != null) {
      wellnessKeywords = <WellnessKeywords>[];
      json['wellnessKeywords'].forEach((v) {
        wellnessKeywords!.add(new WellnessKeywords.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['startdatetime'] = this.startdatetime;
    data['enddatetime'] = this.enddatetime;
    data['type'] = this.type;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['link'] = this.link;
    data['feetype'] = this.feetype;
    data['slidingscalemin'] = this.slidingscalemin;
    data['slidingscalemax'] = this.slidingscalemax;
    data['feepersession'] = this.feepersession;
    data['recurring'] = this.recurring;
    data['recurringschedule'] = this.recurringschedule;
    data['eventstatus'] = this.eventstatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['MemberId'] = this.memberId;
    if (this.wellnessKeywords != null) {
      data['wellnessKeywords'] =
          this.wellnessKeywords!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WellnessKeywords {
  String? name;
  int? id;

  WellnessKeywords({this.name, this.id});

  WellnessKeywords.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

List<EventModelTemp> eventsList = [
  EventModelTemp(
    imageUrl:
        "https://images.unsplash.com/photo-1545205597-3d9d02c29597?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    title: "1 Hours Yoga Guide",
    dateTime: DateTime.now().add(const Duration(days: 2)),
    location: "New York",
    eventBy: user,
    isVirtual: true,
  ),
  EventModelTemp(
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
  EventModelTemp(
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
  EventModelTemp(
    imageUrl:
        "https://images.unsplash.com/photo-1603988363607-e1e4a66962c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
    title: "4 Day Women's Self-Care",
    dateTime: DateTime.now().add(const Duration(days: 8)),
    location: "New York",
    eventBy: user,
    isVirtual: false,
  ),
  EventModelTemp(
    imageUrl:
        "https://images.unsplash.com/photo-1545205597-3d9d02c29597?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    title: "1 Hours Yoga Guide",
    dateTime: DateTime.now().add(const Duration(days: 2)),
    location: "New York",
    eventBy: user,
    isVirtual: true,
  ),
  EventModelTemp(
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
  EventModelTemp(
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
  EventModelTemp(
    imageUrl:
        "https://images.unsplash.com/photo-1603988363607-e1e4a66962c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
    title: "4 Day Women's Self-Care",
    dateTime: DateTime.now().add(const Duration(days: 8)),
    location: "New York",
    eventBy: user,
    isVirtual: false,
  ),
  EventModelTemp(
    imageUrl:
        "https://images.unsplash.com/photo-1545205597-3d9d02c29597?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    title: "1 Hours Yoga Guide",
    dateTime: DateTime.now().add(const Duration(days: 2)),
    location: "New York",
    eventBy: user,
    isVirtual: true,
  ),
  EventModelTemp(
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
  EventModelTemp(
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
  EventModelTemp(
    imageUrl:
        "https://images.unsplash.com/photo-1603988363607-e1e4a66962c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
    title: "4 Day Women's Self-Care",
    dateTime: DateTime.now().add(const Duration(days: 8)),
    location: "New York",
    eventBy: user,
    isVirtual: false,
  ),
];
