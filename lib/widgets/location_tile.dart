import 'package:flutter/material.dart';

import '../config/routes/routes.dart';
import '../constant/app_color.dart';
import '../helper/text_style.dart';
import '../utils/screen_size.dart';

class LocationTile extends StatelessWidget {
  const LocationTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
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
              onPressed: () {
                Navigator.pushNamed(context, Routes.changeLocationScreen);
              },
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
}
