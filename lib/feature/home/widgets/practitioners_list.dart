import 'package:flutter/material.dart';

import '../../../constant/app_color.dart';
import '../../../helper/text_style.dart';
import '../../../utils/screen_size.dart';
import '../domain/model/pracitioners_model.dart';

class NearByPractitionersWidget extends StatelessWidget {
  const NearByPractitionersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nearby Practitioners",
                style: TextStyleHelper.t20b700(),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View all",
                  style: TextStyleHelper.t14b700().copyWith(
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: screenHeight(context) * 0.206,
          width: screenWidth(context),
          // color: Colors.red,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                getPractitioners.length > 5 ? 5 : getPractitioners.length,
            itemBuilder: (context, index) {
              final PractitionersModel data = getPractitioners[index];
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 16 : 10, right: index == 5 ? 16 : 10),
                child: PractitionersCard(data: data),
              );
            },
          ),
        ),
      ],
    );
  }
}

class PractitionersCard extends StatelessWidget {
  const PractitionersCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final PractitionersModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // margin: EdgeInsets.only(
      //     left: index == 0 ? 16 : 10, right: index == 5 ? 16 : 10),
      width: screenWidth(context) * 0.36,
      // height: screenHeight(context) * 0.19,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(10),
        // image: DecorationImage(
        //   image: NetworkImage(data.imageUrl),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            width: screenWidth(context) * 0.22,
            height: screenWidth(context) * 0.22,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.secondaryColor.withOpacity(.5),
                width: 1,
              ),
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(data.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              data.name,
              maxLines: 1,
              style: TextStyleHelper.t18b700(),
            ),
          ),
          Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    data.keyWords.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.5),
                      child: Chip(
                        // padding: EdgeInsets.all(19),
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 0,
                        ),
                        backgroundColor: AppColor.primaryColor.withOpacity(.12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        label: Text(
                          data.keyWords[index],
                          style: TextStyleHelper.t14b600()
                              .copyWith(color: AppColor.primaryColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
