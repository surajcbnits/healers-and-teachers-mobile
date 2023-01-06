import 'package:healersandteachers/constant/api_path.dart';

import '../../events/model/events_model.dart';

class PractitionersModelTemp {
  final String name;
  final String image;
  final List<String> keyWords;
  PractitionersModelTemp({
    required this.name,
    required this.image,
    required this.keyWords,
  });
}

class MemberDetailsDataModel {
  int? count;
  List<MemberDetails>? practitionerList;

  MemberDetailsDataModel({this.count, this.practitionerList});

  MemberDetailsDataModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['rows'] != null) {
      practitionerList = <MemberDetails>[];
      json['rows'].forEach((v) {
        practitionerList!.add(MemberDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = this.count;
    if (this.practitionerList != null) {
      data['rows'] = this.practitionerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberDetails {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? city;
  String? state;
  String? country;
  String? phoneno;
  String? website;
  String? aboutme;
  String? title;
  String? qualification;
  String? facebook;
  String? instagram;
  String? twitter;
  String? image;
  String? physicaladdress;
  String? ip;
  String? virtualsessions;
  List<WellnessKeywords>? wellnessKeywords;

  MemberDetails(
      {this.id,
      this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.city,
      this.state,
      this.country,
      this.phoneno,
      this.website,
      this.aboutme,
      this.title,
      this.qualification,
      this.facebook,
      this.instagram,
      this.twitter,
      this.image,
      this.physicaladdress,
      this.ip,
      this.virtualsessions});

  MemberDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    email = json['email'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    phoneno = json['phoneno'];
    website = json['website'];
    aboutme = json['aboutme'];
    title = json['title'];
    qualification = json['qualification'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    image = json['image'] != null ? ApiPath.baseURL + json['image'] : null;
    physicaladdress = json['physicaladdress'];
    ip = json['ip'];
    virtualsessions = json['virtualsessions'];
    if (json['wellnessKeywords'] != null) {
      wellnessKeywords = <WellnessKeywords>[];
      json['wellnessKeywords'].forEach((v) {
        wellnessKeywords!.add(WellnessKeywords.fromJson(v));
      });
      wellnessKeywords!.sort((a, b) => a.name!.compareTo(b.name!));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['phoneno'] = this.phoneno;
    data['website'] = this.website;
    data['aboutme'] = this.aboutme;
    data['title'] = this.title;
    data['qualification'] = this.qualification;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    data['image'] = this.image;
    data['physicaladdress'] = this.physicaladdress;
    data['ip'] = this.ip;
    data['virtualsessions'] = this.virtualsessions;
    if (this.wellnessKeywords != null) {
      data['wellnessKeywords'] =
          this.wellnessKeywords!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

List<PractitionersModelTemp> getPractitioners = [
  PractitionersModelTemp(
    name: "Esther Howard",
    image:
        "https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    keyWords: ["Massage", "Yoga"],
  ),
  PractitionersModelTemp(
    name: "Xolani Yeboah",
    image:
        "https://images.unsplash.com/photo-1619895862022-09114b41f16f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    keyWords: ["Peace of mind", "coaching"],
  ),
  PractitionersModelTemp(
    name: "Jane",
    image:
        "https://images.unsplash.com/photo-1629467057571-42d22d8f0cbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHByb2ZpbGUlMjBwaG90b3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60",
    keyWords: [
      "Coaching",
      "Yoga",
    ],
  ),
  PractitionersModelTemp(
    name: "Esther Howard",
    image:
        "https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    keyWords: ["Massage", "Yoga"],
  ),
  PractitionersModelTemp(
    name: "Xolani Yeboah",
    image:
        "https://images.unsplash.com/photo-1619895862022-09114b41f16f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    keyWords: ["Peace of mind", "coaching"],
  ),
  PractitionersModelTemp(
    name: "Jane",
    image:
        "https://images.unsplash.com/photo-1629467057571-42d22d8f0cbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHByb2ZpbGUlMjBwaG90b3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60",
    keyWords: [
      "Coaching",
      "Yoga",
    ],
  ),
  PractitionersModelTemp(
    name: "Esther Howard",
    image:
        "https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    keyWords: ["Massage", "Yoga"],
  ),
  PractitionersModelTemp(
    name: "Xolani Yeboah",
    image:
        "https://images.unsplash.com/photo-1619895862022-09114b41f16f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    keyWords: ["Peace of mind", "coaching"],
  ),
  PractitionersModelTemp(
    name: "Jane",
    image:
        "https://images.unsplash.com/photo-1629467057571-42d22d8f0cbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHByb2ZpbGUlMjBwaG90b3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60",
    keyWords: [
      "Coaching",
      "Yoga",
    ],
  ),
  PractitionersModelTemp(
    name: "Esther Howard",
    image:
        "https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
    keyWords: ["Massage", "Yoga"],
  ),
];
