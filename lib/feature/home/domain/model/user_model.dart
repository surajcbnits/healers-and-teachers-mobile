// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String name;
  String profileImage;
  UserModel({
    required this.name,
    required this.profileImage,
  });
}

UserModel user = UserModel(
    name: "John",
    profileImage: "https://randomuser.me/api/portraits/men/40.jpg");
