import 'package:flutter/material.dart';
import 'package:healersandteachers/utils/toCapitalized.dart';

import '../constant/app_color.dart';
import '../helper/text_style.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.deleteIconColor,
    this.labelColor,
    this.onDeleted,
  }) : super(key: key);

  final String title;
  final Color? backgroundColor;
  final Color? deleteIconColor;
  final Color? labelColor;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    return Chip(
      deleteIcon: const Icon(Icons.close),
      labelStyle: TextStyleHelper.t14b600()
          .copyWith(color: labelColor ?? AppColor.primaryColor),
      deleteIconColor: AppColor.white,
      onDeleted: onDeleted,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 0,
      ),
      backgroundColor:
          backgroundColor ?? AppColor.primaryColor.withOpacity(.12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      label: Text(title.toCapitalize()),
    );
  }
}
