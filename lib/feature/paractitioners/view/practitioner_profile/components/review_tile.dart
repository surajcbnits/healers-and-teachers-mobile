import 'package:flutter/material.dart';

import '../../../../../constant/app_color.dart';
import '../../../../../helper/text_style.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.primaryColor.withOpacity(.12),
            radius: 30,
            backgroundImage: const NetworkImage(
                "https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John Doe",
                  style: TextStyleHelper.t16b700(),
                ),
                const SizedBox(height: 5),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Sed consequat eget tellus eget ullamcorper. Sed finibus  cursus turpis et pellentesque. Suspendisse sollicitudin  posuere nunc, eu pharetra diam ornare vitae.",
                  style:
                      TextStyleHelper.t14b400().copyWith(color: AppColor.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}