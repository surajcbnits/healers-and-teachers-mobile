import 'package:flutter/material.dart';

import '../constant/app_color.dart';
import '../helper/text_style.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({
    Key? key,
    this.title = '',
    this.isOnline = false,
    this.color,
    this.iconData,
  }) : super(key: key);

  final String title;
  final IconData? iconData;
  final bool isOnline;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData ?? Icons.location_on,
          color: color ?? AppColor.primaryColor,
        ),
        const SizedBox(width: 10),
        Text(
          isOnline ? "Online" : title,
          style: TextStyleHelper.t14b600().copyWith(
            color: color ?? AppColor.primaryColor,
          ),
        ),
      ],
    );
  }
}
