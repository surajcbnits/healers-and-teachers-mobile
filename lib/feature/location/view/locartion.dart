import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:healersandteachers/constant/app_color.dart';
import 'package:healersandteachers/helper/text_style.dart';

class ChangeLocationScreen extends StatefulWidget {
  const ChangeLocationScreen({super.key});

  @override
  State<ChangeLocationScreen> createState() => _ChangeLocationScreenState();
}

class _ChangeLocationScreenState extends State<ChangeLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                Text(
                  "Location",
                  style: TextStyleHelper.t24b700(),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your City or Zip Code",
                    hintStyle: TextStyleHelper.t14b600().copyWith(
                      color: AppColor.darkBlue.withOpacity(.5),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(
                        Icons.search,
                        size: 30,
                        // color: AppColor.primaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: AppColor.primaryColor,
                      ),
                    ),
                    // enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(16),
                    //   borderSide: const BorderSide(
                    //     color: AppColor.primaryColor,
                    //   ),
                    // ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(16),
                    //   borderSide: BorderSide(
                    //     color: AppColor.primaryColor,
                    //   ),
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColor.primaryColor.withOpacity(.2),
                        child: const Icon(
                          Icons.location_on,
                          size: 30,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Use my current location",
                        style: TextStyleHelper.t16b600(),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  color: AppColor.primaryColor.withOpacity(.2),
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColor.primaryColor.withOpacity(.2),
                        child: const Icon(
                          Icons.videocam_outlined,
                          size: 30,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Online Sessions",
                        style: TextStyleHelper.t16b600(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
