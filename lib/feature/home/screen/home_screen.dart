import 'package:flutter/material.dart';
import 'package:healersandteachers/config/routes/routes.dart';
import 'package:healersandteachers/constant/app_color.dart';

import '../../../helper/text_style.dart';
import '../../../utils/screen_size.dart';
import '../../../widgets/circular_profile.dart';
import '../../../widgets/location_tile.dart';
import '../domain/model/user_model.dart';
import 'widgets/categories_list.dart';
import 'widgets/events_list.dart';
import 'widgets/practitioners_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print("size.width, size.height: ${size.width * .4}, ${size.height * 0.13}");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    profileTile(size),
                    // const SizedBox(height: 20),
                    // locationTile(size),
                  ],
                ),
              ),
              const CategoriesListWidget(),
              const NearByPractitionersWidget(),
              const EventsListTileWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget locationTile(Size size) {
    return const LocationTile();
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
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Text(
            //       "Good Morning",
            //       style: TextStyleHelper.t18b400(),
            //     ),
            //     const SizedBox(width: 4),
            //     const Text(
            //       "👋",
            //       style: TextStyle(fontSize: 30),
            //     ),
            //     // Icon(AppIcon.handWave),
            //   ],
            // ),
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
