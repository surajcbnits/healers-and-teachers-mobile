import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/events/model/events_model.dart';

import '../../../../config/routes/routes.dart';
import '../../../../constant/app_color.dart';
import '../../../../helper/text_style.dart';
import '../../../events/screen/widgets/event_card.dart';

class EventsListTileWidget extends StatefulWidget {
  const EventsListTileWidget({super.key});

  @override
  State<EventsListTileWidget> createState() => _EventsListTileWidgetState();
}

class _EventsListTileWidgetState extends State<EventsListTileWidget> {
  bool showOnline = false;

  @override
  Widget build(BuildContext context) {
    // int length = eventsList.length > 3 ? 3 : eventsList.length;
    return Column(
      children: [
        // const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Events",
                style: TextStyleHelper.t20b700(),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.eventScreen);
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
        // for (var i = 0; i < length; i++) EventCard(index: i)
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: eventsList.length > 3 ? 3 : eventsList.length,
          itemBuilder: (context, index) {
            final data = eventsList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: EventCard(eventData: data),
            );
          },
        ),
      ],
    );
  }
}
