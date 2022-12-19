import 'package:flutter/material.dart';
import 'package:healersandteachers/helper/text_style.dart';

import '../../../config/routes/routes.dart';
import '../../../constant/app_color.dart';
import '../../../widgets/chip.dart';
import '../../../widgets/icon_text_widget.dart';
import '../model/pracitioners_model.dart';

class PractitionerScreen extends StatelessWidget {
  const PractitionerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practitioners'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${getPractitioners.length} Practitioners",
                  style: TextStyleHelper.t14b600().copyWith(
                    color: AppColor.grey,
                  ),
                ),
                OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      // primary: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      side: const BorderSide(color: AppColor.primaryColor),
                    ),
                    icon: const Icon(Icons.filter_list),
                    label: Text("Filter",
                        style: TextStyleHelper.t16b600().copyWith(
                          color: AppColor.primaryColor,
                        ))),
              ],
            ),
            // TODO:
            // need to sort the list according to the distance
            // and first show the nearest one if many are available
            Expanded(
              child: ListView.separated(
                // shrinkWrap: true,
                itemCount: getPractitioners.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 20,
                    thickness: 1,
                  );
                },
                itemBuilder: (context, index) {
                  final PractitionersModel data = getPractitioners[index];
                  return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.practitionerProfileScreen,
                            arguments: data);
                      },
                      child: PractitionerListCard(data: data));
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}

class PractitionerListCard extends StatelessWidget {
  const PractitionerListCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final PractitionersModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: AppColor.primaryColor.withOpacity(.12),
          radius: 45,
          backgroundImage: NetworkImage(data.image),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name,
                style: TextStyleHelper.t18b700(),
              ),
              Text(
                "Certified yoga and breathwork teacher",
                style: TextStyleHelper.t14b600().copyWith(
                  // height: 1.2,
                  color: AppColor.grey,
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    data.keyWords.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.5),
                      child: CustomChip(title: data.keyWords[index]),
                    ),
                  ),
                ],
              ),
              const IconTextWidget(
                isOnline: false,
                title: "7893 Miles",
                color: AppColor.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
