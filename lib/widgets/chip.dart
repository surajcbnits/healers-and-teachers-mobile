import 'package:flutter/material.dart';

import '../constant/app_color.dart';
import '../helper/text_style.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Chip(
      // padding: EdgeInsets.all(19),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 0,
      ),
      backgroundColor: AppColor.primaryColor.withOpacity(.12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      label: Text(
        title,
        style: TextStyleHelper.t14b600().copyWith(color: AppColor.primaryColor),
      ),
    );
  }
}