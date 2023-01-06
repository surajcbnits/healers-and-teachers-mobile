import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/services/model/services_model.dart';
import 'package:healersandteachers/widgets/read_more_text.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../constant/app_color.dart';
import '../../../helper/text_over_mage.dart';
import '../../../helper/text_style.dart';
import '../../../utils/screen_size.dart';
import '../../../widgets/chip.dart';

class ServicesTile extends StatelessWidget {
  const ServicesTile({
    Key? key,
    required this.serviceData,
  }) : super(key: key);
  final ServiceModel serviceData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: _buildImage(context),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: _buildDetail(context),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ReadMoreText(text: serviceData.description!, breakingLength: 120),
        ],
      ),
    );
  }

  Widget _buildDetail(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: screenHeight(context) * 0.14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            serviceData.name!.trim(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleHelper.t18b700(),
          ),
          // SizedBox(height: 5),
          Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    serviceData.wellnessKeywords!.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.5),
                      child: CustomChip(
                          title: serviceData.wellnessKeywords![index].name!),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Expanded(
              //   child: IconTextWidget(
              //     iconData: Icons.access_time_filled_outlined,
              //     iconSize: 20.0,
              //     title: "${serviceData.duration} hour",
              //     color: AppColor.grey,
              //   ),
              // ),
              Text(
                getPrice(),
                style: TextStyleHelper.t14b600()
                    .copyWith(color: AppColor.primaryColor),
              ),
              OutlinedButton(
                onPressed: () {
                  bottomSheetBookingTime(context);
                },
                child: const Text(
                  "Book Now",
                  // style: TextStyle(color: AppColor.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  String getPrice() {
    if (serviceData.feetype == "sliding scale") {
      return "\$${serviceData.slidingscalemin} - \$${serviceData.slidingscalemax}";
    } else if (serviceData.feetype == "fixed") {
      return "\$${serviceData.feepersession}";
    } else if (serviceData.feetype == "free") {
      return "Free";
    }
    return "";
  }

  Widget _buildImage(context) {
    return Container(
      height: screenHeight(context) * 0.14,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.secondaryColor,
        image: DecorationImage(
          image: NetworkImage(serviceData.image!),
          fit: BoxFit.cover,
        ),
      ),
      child: TextOverImage(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        title: "${serviceData.duration} hour",
        style: TextStyleHelper.t14b700().copyWith(
          color: AppColor.white,
        ),
      ),
    );
  }

  Future<dynamic> bottomSheetBookingTime(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        DateTime focusDay = DateTime.now();
        return StatefulBuilder(builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TableCalendar(
                    focusedDay: focusDay,
                    firstDay: DateTime(1999),
                    lastDay: DateTime(3000),
                    onDaySelected: (selectedDay, focusedDay) {
                      print(selectedDay);
                      state(() {
                        focusDay = selectedDay;
                        focusDay = focusedDay;
                      });
                    },
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      // titleTextStyle: TextStyleHelper.t16b700(),
                    ),
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      selectedTextStyle: TextStyleHelper.t16b700(),
                      todayTextStyle: TextStyleHelper.t16b700(),
                    ),
                  ),
                  // Text(
                  //   "Contact Me",
                  //   style: TextStyleHelper.t24b700(),
                  // ),
                  // Flexible(
                  //   child: ListTile(
                  //     // contentPadding: EdgeInsets.zero,
                  //     // horizontalTitleGap: 0,
                  //     leading: const Icon(Icons.phone),
                  //     title: const Text("+16465780322"),
                  //     onTap: () {},
                  //   ),
                  // ),

                  // Container(
                  //   height: 200,
                  //   child: CupertinoDatePicker(
                  //     onDateTimeChanged: (value) {},
                  //     use24hFormat: true,

                  //     mode: CupertinoDatePickerMode.time,

                  //     // initialDate: DateTime.now(),
                  //     // firstDate: DateTime(1999),
                  //     // lastDate: DateTime(3000)
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
