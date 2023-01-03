
class CategoriesModel {
  final String name;
  final String imageUrl;

  CategoriesModel({required this.name, required this.imageUrl});
}

// List of categories
// 👇
// Meditation
// Yoga
// Breathwork
// Reiki
// Psychedelics & Plant Medicine
// Taichi & Qigong
// Counseling
// Prayer
// Life Design
// Balinese Healing
// List<CategoriesModel> get categoriesListData => categoriesList.sort((a, b) => a.name.compareTo(b.name));

List<CategoriesModel> categoriesList = [
  CategoriesModel(
    name: "Meditation",
    imageUrl:
        "https://images.unsplash.com/photo-1506126613408-eca07ce68773?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fE1lZGl0YXRpb258ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
  ),
  CategoriesModel(
    name: "Yoga",
    imageUrl:
        "https://images.unsplash.com/photo-1603988363607-e1e4a66962c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
  ),
  CategoriesModel(
    name: "Breathwork",
    imageUrl:
        "https://images.unsplash.com/photo-1545389336-cf090694435e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
  ),
  CategoriesModel(
    name: "Reiki",
    imageUrl:
        "https://images.unsplash.com/photo-1579291465308-fba6c5db2dfe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHJlaWtpJTIwaGVhbGluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60",
  ),
  CategoriesModel(
    name: "Psychedelics & Plant Medicine",
    imageUrl:
        "https://images.unsplash.com/photo-1506368249639-73a05d6f6488?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fFBsYW50JTIwTWVkaWNpbmV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
  ),
  CategoriesModel(
    name: "Taichi & Qigong",
    imageUrl:
        "https://images.unsplash.com/photo-1529535260226-f5db9210ce89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8VGFpY2hpfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
  ),
  CategoriesModel(
    name: "Counseling",
    imageUrl:
        "https://images.unsplash.com/photo-1604881991664-593b31b88488?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Q291bnNlbGluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60",
  ),
  CategoriesModel(
    name: "Prayer",
    imageUrl:
        "https://images.unsplash.com/photo-1520642413789-2bd6770d59e3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHByYXllciUyMGdyb3VwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
  ),
  CategoriesModel(
    name: "Life Design",
    imageUrl:
        "https://images.unsplash.com/photo-1584589167171-541ce45f1eea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGlmZSUyMHN0eWxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
  ),
  CategoriesModel(
    name: "Balian Healing",
    imageUrl:
        "https://images.unsplash.com/photo-1582107208835-973713624596?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fEhlYWxpbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
  ),
];
