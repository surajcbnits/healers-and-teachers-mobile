import 'package:flutter/material.dart';

import '../../../../constant/app_color.dart';
import '../../../../helper/text_style.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({
    Key? key,
    required this.location,
    required this.isOnline,
  }) : super(key: key);

  final String location;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: AppColor.primaryColor,
        ),
        // SizedBox(width: 10),
        Text(
          isOnline ? "Online" : location,
          style: TextStyleHelper.t14b600().copyWith(
            color: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }
}
