import '../../../constant/api_path.dart';
import '../../events/model/events_model.dart';

class ServiceDataModel {
  List<ServiceModel>? serviceDataList;

  ServiceDataModel({this.serviceDataList});

  ServiceDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      serviceDataList = <ServiceModel>[];
      json['data'].forEach((v) {
        serviceDataList!.add(ServiceModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.serviceDataList != null) {
      data['data'] = this.serviceDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceModel {
  int? id;
  String? name;
  String? image;
  String? description;
  String? duration;
  String? feetype;
  int? slidingscalemin;
  int? slidingscalemax;
  dynamic? feepersession;
  String? servicestatus;
  String? createdAt;
  String? updatedAt;
  int? memberId;
  List<WellnessKeywords>? wellnessKeywords;

  ServiceModel(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.duration,
      this.feetype,
      this.slidingscalemin,
      this.slidingscalemax,
      this.feepersession,
      this.servicestatus,
      this.createdAt,
      this.updatedAt,
      this.memberId,
      this.wellnessKeywords});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'] != null ? ApiPath.baseURL + json['image'] : null;
    description = json['description'];
    duration = json['duration'];
    feetype = json['feetype'];
    slidingscalemin = json['slidingscalemin'];
    slidingscalemax = json['slidingscalemax'];
    feepersession = json['feepersession'];
    servicestatus = json['servicestatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    memberId = json['MemberId'];
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
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['feetype'] = this.feetype;
    data['slidingscalemin'] = this.slidingscalemin;
    data['slidingscalemax'] = this.slidingscalemax;
    data['feepersession'] = this.feepersession;
    data['servicestatus'] = this.servicestatus;
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
