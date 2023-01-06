import 'package:flutter/material.dart';
import 'package:healersandteachers/constant/api_path.dart';
import 'package:healersandteachers/widgets/icon_text_widget.dart';
import 'package:provider/provider.dart';

import '../../../../config/routes/routes.dart';
import '../../../../constant/app_color.dart';
import '../../../../helper/text_style.dart';
import '../../../../utils/screen_size.dart';
import '../../../../widgets/chip.dart';
import '../../../../widgets/circular_profile.dart';
import '../../../paractitioners/model/pracitioners_model.dart';
import '../../../paractitioners/providers/paractitioners_provider.dart';

class NearByPractitionersWidget extends StatefulWidget {
  const NearByPractitionersWidget({super.key});

  @override
  State<NearByPractitionersWidget> createState() =>
      _NearByPractitionersWidgetState();
}

class _NearByPractitionersWidgetState extends State<NearByPractitionersWidget> {
  bool isLoading = true;
  @override
  void initState() {
    Provider.of<PractitionersProvider>(context, listen: false)
        .fetchPractitionersList()
        .whenComplete(() => setState(() {
              isLoading = false;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? Column(
            children: [
              // const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Practitioners",
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

              Consumer<PractitionersProvider>(
                builder: (context, p, child) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: screenWidth(context) * 0.48,
                    width: screenWidth(context),
                    // color: Colors.red,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: p.practitionersData.practitionerList!
                          .length, //> 5 ? 5 : getPractitioners.length,
                      itemBuilder: (context, index) {
                        // if (index == getPractitioners.length) {
                        //   return Padding(
                        //     padding: EdgeInsets.only(
                        //         left: index == 0 ? 16 : 10, right: index == 5 ? 16 : 10),
                        //     child: const ViewAllButton(),
                        //   );
                        // }
                        final MemberDetails data =
                            p.practitionersData.practitionerList![index];
                        return Padding(
                          padding: EdgeInsets.only(
                              left: index == 0 ? 16 : 10,
                              right: index == 5 ? 16 : 10),
                          child: PractitionersCard(data: data),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          )
        : const SizedBox();
  }
}

class PractitionersCard extends StatelessWidget {
  const PractitionersCard({
    Key? key,
    required this.data,
    this.showDistance = false,
  }) : super(key: key);

  final MemberDetails data;
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
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OuterCircularProfile(
              radius: screenWidth(context) * 0.22,
              image: NetworkImage(data.image!),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "${data.firstName!.trim()} ${data.lastName!.trim()}",
                maxLines: 1,
                style: TextStyleHelper.t18b700(),
                textAlign: TextAlign.center,
              ),
            ),
            showDistance
                ? IconTextWidget(
                    title: "${data.state!} ${data.city!}",
                    color: AppColor.grey,
                  )
                : Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...List.generate(
                            data.wellnessKeywords!.length,
                            (index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.5),
                                child: CustomChip(
                                    title: data.wellnessKeywords![index].name!),
                              );
                            },
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
