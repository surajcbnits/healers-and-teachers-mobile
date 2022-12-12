import 'package:flutter/material.dart';
import 'package:healersandteachers/helper/text_style.dart';

import '../constant/app_color.dart';
import '../utils/screen_size.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({
    Key? key,
    this.title = "View all",
    this.onPressed,
  }) : super(key: key);
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // margin: EdgeInsets.only(
        //     left: index == 0 ? 16 : 10, right: index == 5 ? 16 : 10),
        width: screenWidth(context) * 0.2,
        // height: screenWidth(context) * 0.36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(10),
          color: AppColor.primaryColor.withOpacity(0.2),
        ),
        child: Text(
          title,
          style: TextStyleHelper.t14b700().copyWith(
            color: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}