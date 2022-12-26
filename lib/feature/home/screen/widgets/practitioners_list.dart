import 'package:flutter/material.dart';
import 'package:healersandteachers/widgets/icon_text_widget.dart';

import '../../../../config/routes/routes.dart';
import '../../../../constant/app_color.dart';
import '../../../../helper/text_style.dart';
import '../../../../utils/screen_size.dart';
import '../../../../widgets/chip.dart';
import '../../../../widgets/circular_profile.dart';
import '../../../paractitioners/model/pracitioners_model.dart';

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
                onPressed: () {
                  Navigator.pushNamed(context, Routes.practitionerScreen);
                },
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
          height: screenWidth(context) * 0.45,
          width: screenWidth(context),
          // color: Colors.red,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                getPractitioners.length, //> 5 ? 5 : getPractitioners.length,
            itemBuilder: (context, index) {
              // if (index == getPractitioners.length) {
              //   return Padding(
              //     padding: EdgeInsets.only(
              //         left: index == 0 ? 16 : 10, right: index == 5 ? 16 : 10),
              //     child: const ViewAllButton(),
              //   );
              // }
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
    this.showDistance = false,
  }) : super(key: key);

  final PractitionersModel data;
  final bool showDistance;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.practitionerProfileScreen,
            arguments: data);
      },
      child: Container(
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
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OuterCircularProfile(
              radius: screenWidth(context) * 0.22,
              image: NetworkImage(data.image),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                data.name,
                maxLines: 1,
                style: TextStyleHelper.t18b700(),
              ),
            ),
            showDistance
                ? const IconTextWidget(
                    title: "7890 Miles",
                    color: AppColor.grey,
                  )
                : Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...List.generate(
                            data.keyWords.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.5),
                              child: CustomChip(title: data.keyWords[index]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
