import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/home/domain/model/events_model.dart';

import '../../../constant/app_color.dart';
import '../../../helper/text_style.dart';
import '../../../utils/screen_size.dart';

class EventsListTileWidget extends StatelessWidget {
  const EventsListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Events",
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
            // scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              final EventModel data = eventsList[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        // width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(data.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: TextStyleHelper.t16b700(),
                          ),
                          SizedBox(height: 5),
                          Text(
                            data.dateTime.toIso8601String(),
                            style: TextStyleHelper.t14b600(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
              // return Padding(
              //   padding: EdgeInsets.only(
              //       left: index == 0 ? 16 : 10, right: index == 5 ? 16 : 10),
              //   child: PractitionersCard(data: data),
              // );
            },
          ),
        ),
      ],
    );
  }
}
