import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/events/Provider/events_provider.dart';
import 'package:healersandteachers/feature/events/model/events_model.dart';
import 'package:provider/provider.dart';

import '../../../../config/routes/routes.dart';
import '../../../../constant/app_color.dart';
import '../../../../helper/text_style.dart';
import '../../../events/view/event_screen/widgets/event_card.dart';

class EventsListTileWidget extends StatefulWidget {
  const EventsListTileWidget({super.key});

  @override
  State<EventsListTileWidget> createState() => _EventsListTileWidgetState();
}

class _EventsListTileWidgetState extends State<EventsListTileWidget> {
  bool showOnline = false;
  bool isLoading = false;
  List<EventDetails> eventsDataList = [];

  @override
  void initState() {
    Provider.of<EventProvider>(context, listen: false)
        .fetchAllEventsList()
        .then((value) {
      setState(() {
        eventsDataList = value!;
      });
    }).whenComplete(() => setState(() {
              isLoading = false;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // int length = eventsList.length > 3 ? 3 : eventsList.length;
    return isLoading
        ? const SizedBox()
        : Column(
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

              // NOTE: Event User info not on api
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    eventsDataList.length > 3 ? 3 : eventsDataList.length,
                itemBuilder: (context, index) {
                  final data = eventsDataList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: EventCard(eventDetail: data),
                  );
                },
              ),
            ],
          );
  }
}
