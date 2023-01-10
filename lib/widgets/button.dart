import 'package:flutter/material.dart';

import '../constant/app_color.dart';
import '../helper/text_style.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key, required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap ;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          // primary: AppColor.primaryColor,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(5)),
          side: const BorderSide(
              color: AppColor.primaryColor),
        ),
        icon: const Icon(Icons.filter_list,
            color: AppColor.primaryColor),
        label: Text("Filter",
            style: TextStyleHelper.t16b600()
                .copyWith(
              color: AppColor.primaryColor,
            )));
  }
}