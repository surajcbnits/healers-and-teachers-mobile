import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/categories/provider/categories_provider.dart';
import 'package:provider/provider.dart';

import '../../../../config/routes/routes.dart';
import '../../../../constant/app_color.dart';
import '../../../../helper/buttons.dart';
import '../../../../helper/text_over_mage.dart';
import '../../../../helper/text_style.dart';
import '../../../../utils/screen_size.dart';
import '../../../categories/model/categories_model.dart';

class CategoriesListWidget extends StatefulWidget {
  const CategoriesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  bool isLoading = false;
  List<CategoriesDataModel> categoryList = [];
  @override
  void initState() {
    Provider.of<CategoriesProvider>(context, listen: false)
        .fetchAllCategoryList()
        .then((value) {
      setState(() {
        categoryList = value;
      });
    }).whenComplete(() => setState(() {
              isLoading = false;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // categoryList.shuffle();
    // print("categoriesList: $categoriesList");
    return isLoading
        ? const SizedBox()
        : Column(
            children: [
              // const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Wellness Resources",
                      style: TextStyleHelper.t20b700(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.categoriesScreen);
                      },
                      child: Text(
                        "View all",
                        style: TextStyleHelper.t14b700().copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: screenHeight(context) * 0.22,
                width: screenWidth(context),
                // color: Colors.red,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      categoryList.length, //> 5 ? 5 : categoriesList.length,
                  itemBuilder: (context, index) {
                    // if (index == categoriesList.length) {
                    //   return Padding(
                    //     padding: EdgeInsets.only(
                    //         left: index == 0 ? 16 : 10, right: index == 5 ? 16 : 10),
                    //     child: ViewAllButton(
                    //       onPressed: () =>
                    //           Navigator.pushNamed(context, Routes.categoriesScreen),
                    //     ),
                    //   );
                    // }
                    final CategoriesDataModel data = categoryList[index];
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? 16 : 10,
                          right: index == 5 ? 16 : 10),
                      child: CategoriesCard(data: data),
                    );
                  },
                ),
              ),
            ],
          );
  }
}

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final CategoriesDataModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.categoriesDetailScreen,
            arguments: data);
      },
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // margin: EdgeInsets.only(
        //     left: index == 0 ? 16 : 10, right: index == 5 ? 16 : 10),
        width: screenWidth(context) * 0.36,
        height: screenHeight(context) * 0.22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(data.image!),
            fit: BoxFit.cover,
          ),
        ),
        child: TextOverImage(title: data.name!, maxLine: 2),
      ),
    );
  }
}
