import 'package:flutter/material.dart';
import 'package:healersandteachers/helper/text_style.dart';

import '../constant/app_color.dart';

class TextOverImage extends StatelessWidget {
  const TextOverImage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.transparent,
            AppColor.transparent,
            AppColor.black.withOpacity(0.5),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyleHelper.t18b700().copyWith(
              color: AppColor.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
