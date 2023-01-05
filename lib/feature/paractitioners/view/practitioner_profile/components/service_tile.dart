import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../constant/app_color.dart';
import '../../../../../helper/text_style.dart';
import '../../../../../utils/screen_size.dart';
import '../../../../../widgets/chip.dart';
import '../../../../../widgets/icon_text_widget.dart';
import '../../../model/pracitioners_model.dart';

class ServicesTile extends StatelessWidget {
  const ServicesTile({
    Key? key,
    required this.practitionerData,
  }) : super(key: key);
  final PractitionersModelTemp practitionerData;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: double.infinity,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: _buildImage(context),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: _buildDetail(context),
              ),
            ],
          ),
          // Row(
          //   children: [
          //     ...List.generate(
          //       practitionerData.keyWords.length,
          //       (index) => Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 2.5),
          //         child: CustomChip(title: practitionerData.keyWords[index]),
          //       ),
          //     ),
          //   ],
          // ),
          // Row(
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: const [
          //         IconTextWidget(
          //           isOnline: true,
          //           color: AppColor.grey,
          //         ),
          //         IconTextWidget(
          //           iconData: Icons.access_time_filled_outlined,
          //           title: "1 hour",
          //           color: AppColor.grey,
          //         ),
          //       ],
          //     ),
          //     const Spacer(),
          //     ElevatedButton(
          //       onPressed: () {
          //         bottomSheetBookingTime(context);
          //       },
          //       child: const Text(
          //         "Book Now",
          //         style: TextStyle(color: AppColor.white),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _buildDetail(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) * 0.14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            practitionerData.name!.trim(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyleHelper.t18b700(),
          ),
          // SizedBox(height: 5),
          Row(
            children: [
              ...List.generate(
                practitionerData.keyWords.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.5),
                  child: CustomChip(title: practitionerData.keyWords[index]),
                ),
              ),
            ],
          ),
          Text(
            "Time",
            style: TextStyleHelper.t16b600().copyWith(
              color: AppColor.darkBlue.withOpacity(.6),
            ),
          ),
          Text(
            "cost",
            style: TextStyleHelper.t16b600().copyWith(
              color: AppColor.darkBlue.withOpacity(.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(
    context,
  ) {
    return Container(
      height: screenHeight(context) * 0.14,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.secondaryColor,
        image: DecorationImage(
          image: NetworkImage(practitionerData.image),
          fit: BoxFit.cover,
        ),
      ),
      // child: TextOverImage(
      //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      //   title: convertDate(eventData.startdatetime!),
      //   style: TextStyleHelper.t14b700().copyWith(
      //     color: AppColor.white,
      //   ),
      // ),
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
