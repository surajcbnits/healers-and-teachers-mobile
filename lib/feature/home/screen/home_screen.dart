import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healersandteachers/constant/app_color.dart';
import 'package:healersandteachers/constant/app_icon.dart';
import 'package:healersandteachers/constant/app_image.dart';
import 'package:healersandteachers/feature/home/domain/model/categories_model.dart';
import 'package:healersandteachers/utils/screen_size.dart';

import '../../../helper/text_over_mage.dart';
import '../../../helper/text_style.dart';
import '../domain/model/pracitioners_model.dart';
import '../domain/model/user_model.dart';
import '../widgets/categories_list.dart';
import '../widgets/events_list.dart';
import '../widgets/practitioners_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print("size.width, size.height: ${size.width * .4}, ${size.height * 0.19}");
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
                    const SizedBox(height: 36),
                    locationTile(size),
                  ],
                ),
              ),
              const EventsListTileWidget(),
              const CategoriesListWidget(),
              const NearByPractitionersWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Container locationTile(Size size) {
    return Container(
      width: size.width,
      // height: size.width * 0.11,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.location_on,
            color: AppColor.primaryColor,
            size: 30,
          ),
          const SizedBox(width: 8),
          Text(
            "San Francisco, California",
            style: TextStyleHelper.t14b600(),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {},
              child: Text(
                "Change",
                style: TextStyleHelper.t16b700().copyWith(
                  color: AppColor.primaryColor,
                ),
              ))
        ],
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
            // const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Good Morning",
                  style: TextStyleHelper.t18b400(),
                ),
                const SizedBox(width: 4),
                const Text(
                  "👋",
                  style: TextStyle(fontSize: 30),
                ),
                // SvgPicture.asset(AppIcon.handWave),
              ],
            ),
          ],
        ),
        Container(
          width: size.width * 0.16,
          height: size.width * 0.16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColor.secondaryColor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 0),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(user.profileImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.white.withOpacity(0.5),
                width: 3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
