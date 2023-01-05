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
    this.isTextThin = false,
  }) : super(key: key);

  final String title;
  final IconData? iconData;
  final bool isOnline;
  final Color? color;
  final bool isTextThin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData ?? Icons.location_on,
          color: color ?? AppColor.primaryColor,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            isOnline ? "Online" : title,
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: isTextThin
                ? TextStyleHelper.t14b400().copyWith(
                    color: color ?? AppColor.primaryColor,
                  )
                : TextStyleHelper.t14b600().copyWith(
                    color: color ?? AppColor.primaryColor,
                  ),
          ),
        ),
      ],
    );
  }
}
