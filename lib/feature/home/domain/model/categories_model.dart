import '../../../../constant/app_image.dart';

class CategoriesModel {
  final String name;
  final String imageUrl;

  CategoriesModel({required this.name, required this.imageUrl});

  // factory CategoriesModel.fromJson(Map<String, dynamic> json) {
  //   return CategoriesModel(
  //     name: json['name'],
  //     imageUrl: json['image'],
  //   );
  // }
}

List<CategoriesModel> categoriesList = [
  CategoriesModel(
    name: "Massage",
    imageUrl:
        "https://images.unsplash.com/photo-1639162906614-0603b0ae95fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fG1hc3NhZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
  ),
  CategoriesModel(
    name: "Yoga",
    imageUrl:
        "https://images.unsplash.com/photo-1603988363607-e1e4a66962c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
  ),
  CategoriesModel(
    name: "Peace of mind",
    imageUrl:
        "https://images.unsplash.com/photo-1545389336-cf090694435e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
  ),
  // CategoriesModel(
  //   name: "Gym",
  //   imageUrl: AppImage.gym,
  // ),
  // CategoriesModel(
  //   name: "Pilates",
  //   imageUrl: AppImage.pilates,
  // ),
  // CategoriesModel(
  //   name: "Dance",
  //   imageUrl: AppImage.dance,
  // ),
];
