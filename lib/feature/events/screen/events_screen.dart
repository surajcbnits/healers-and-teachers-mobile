import 'package:flutter/material.dart';

import '../../../constant/app_color.dart';
import '../../../helper/text_style.dart';
import '../../../widgets/chip.dart';
import '../../../widgets/location_tile.dart';
import '../model/events_model.dart';
import 'widgets/event_card.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Events"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const LocationTile(),
                // const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Text(" "),
                      Expanded(
                        child: Wrap(
                          spacing: 10,
                          children: List.generate(
                            2,
                            (index) => CustomChip(
                              title: "All",
                              labelColor: AppColor.white,
                              onDeleted: () {},
                              backgroundColor: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      // CustomChip(
                      //   title: "All",
                      //   labelColor: AppColor.white,
                      //   onDeleted: () {},
                      //   backgroundColor: AppColor.primaryColor,
                      // ),
                      OutlinedButton.icon(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            // primary: AppColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            side:
                                const BorderSide(color: AppColor.primaryColor),
                          ),
                          icon: const Icon(Icons.filter_list),
                          label: Text("Filter",
                              style: TextStyleHelper.t16b600().copyWith(
                                color: AppColor.primaryColor,
                              ))),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: eventsList.length,
                    itemBuilder: (context, index) {
                      final data = eventsList[index];
                      return EventCard(eventData: data);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
