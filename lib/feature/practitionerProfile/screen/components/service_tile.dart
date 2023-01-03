import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../constant/app_color.dart';
import '../../../../helper/text_style.dart';
import '../../../../widgets/chip.dart';
import '../../../../widgets/icon_text_widget.dart';
import '../../../paractitioners/model/pracitioners_model.dart';

class ServicesTile extends StatelessWidget {
  const ServicesTile({
    Key? key,
    required this.practitionerData,
  }) : super(key: key);
  final PractitionersModelTemp practitionerData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Discovery call",
              style: TextStyleHelper.t16b700(),
            ),
            Text(
              "Free",
              style: TextStyleHelper.t16b600().copyWith(
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
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
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                IconTextWidget(
                  isOnline: true,
                  color: AppColor.grey,
                ),
                IconTextWidget(
                  iconData: Icons.access_time_filled_outlined,
                  title: "1 hour",
                  color: AppColor.grey,
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
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
              },
              child: const Text(
                "Book Now",
                style: TextStyle(color: AppColor.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
