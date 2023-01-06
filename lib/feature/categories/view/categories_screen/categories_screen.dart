import 'package:flutter/material.dart';
import 'package:healersandteachers/constant/app_color.dart';
import 'package:healersandteachers/helper/text_style.dart';

import '../../../../config/routes/routes.dart';
import '../../model/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wellness Resources'),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: categoriesList.length + 1,
          itemBuilder: (context, index) {
            categoriesList.sort((a, b) => a.name.compareTo(b.name));
            if (index == 0) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.primaryColor.withOpacity(0.1),
                    // backgroundImage: NetworkImage(data.imageUrl),
                    radius: 40,
                    child: const Icon(
                      Icons.grid_view_sharp,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("All",
                      textAlign: TextAlign.center,
                      style: TextStyleHelper.t16b700()),
                ],
              );
            }
            // index = index - 1;
            final CategoriesModelTemp data = categoriesList[index - 1];
            return InkWell(
              onTap: () {
                // Navigator.pushNamed(context, Routes.categoriesScreen);
                Navigator.pushNamed(context, Routes.categoriesDetailScreen,
                    arguments: data);
              },
              child: Container(
                // color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.primaryColor.withOpacity(0.1),
                      backgroundImage: NetworkImage(data.imageUrl),
                      radius: 40,
                    ),
                    const SizedBox(height: 10),
                    Text(data.name,
                        textAlign: TextAlign.center,
                        style: TextStyleHelper.t16b700()),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
