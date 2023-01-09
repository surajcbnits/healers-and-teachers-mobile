import 'package:flutter/material.dart';
import 'package:healersandteachers/config/routes/routes.dart';
import 'package:healersandteachers/constant/app_color.dart';
import 'package:provider/provider.dart';

import '../../../helper/text_over_mage.dart';
import '../../../helper/text_style.dart';
import '../../../utils/screen_size.dart';
import '../../../widgets/circular_profile.dart';
import '../../categories/model/categories_model.dart';
import '../../categories/provider/categories_provider.dart';
import '../domain/model/user_model.dart';
import 'widgets/categories_list.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  bool isLoading = true;
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
    final Size size = MediaQuery.of(context).size;
    print("size.width, size.height: ${size.width * .4}, ${size.height * 0.13}");
    return Scaffold(
      body: SafeArea(
        child: Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : CategoriesListWidget2(categoryList: categoryList)),
      ),
    );
  }

  Row profileTile(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi ${user.name},",
              style: TextStyleHelper.t24b700(),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.changeLocationScreen);
              },
              child: Container(
                // width: screenWidth(context),
                // height: size.width * 0.11,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColor.primaryColor,
                      // size: 30,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "San Francisco, California",
                      style: TextStyleHelper.t14b600(),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.edit,
                      color: AppColor.darkBlue,
                      size: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        CircularProfile(
          image: NetworkImage(user.profileImage),
          backgroundColor: AppColor.secondaryColor.withOpacity(0.5),
          radius: 35,
        ),
      ],
    );
  }
}

class CategoriesListWidget2 extends StatelessWidget {
  const CategoriesListWidget2({
    Key? key,
    required this.categoryList,
  }) : super(key: key);
  final List<CategoriesDataModel> categoryList;

  @override
  Widget build(BuildContext context) {
    // print("categoriesList: $categoriesList");
    return Column(
      children: [
        // const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Text(
            "Wellness Resources",
            style: TextStyleHelper.t20b700(),
          ),
        ),
        Expanded(
          // margin: const EdgeInsets.only(bottom: 10),
          // width: screenWidth(context),
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: categoriesList.length, //> 5 ? 5 : categoriesList.length,
            itemBuilder: (context, index) {
              final CategoriesDataModel data = categoryList[index];
              return CategoriesCard(data: data);
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
            image: NetworkImage(data.image ?? ""),
            fit: BoxFit.cover,
          ),
        ),
        child: TextOverImage(title: data.name!, maxLine: 2),
      ),
    );
  }
}
