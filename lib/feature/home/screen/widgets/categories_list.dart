import 'package:flutter/material.dart';

import '../../../../config/routes/routes.dart';
import '../../../../constant/app_color.dart';
import '../../../../helper/buttons.dart';
import '../../../../helper/text_over_mage.dart';
import '../../../../helper/text_style.dart';
import '../../../../utils/screen_size.dart';
import '../../../categories/model/categories_model.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    categoriesList.shuffle();
    // print("categoriesList: $categoriesList");
    return Column(
      children: [
        // const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
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
                categoriesList.length , //> 5 ? 5 : categoriesList.length,
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
              final CategoriesModel data = categoriesList[index];
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 16 : 10, right: index == 5 ? 16 : 10),
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

  final CategoriesModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // margin: EdgeInsets.only(
      //     left: index == 0 ? 16 : 10, right: index == 5 ? 16 : 10),
      width: screenWidth(context) * 0.36,
      height: screenHeight(context) * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(data.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: TextOverImage(title: data.name, maxLine: 2),
    );
  }
}
