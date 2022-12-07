import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/home/domain/model/events_model.dart';
import 'package:intl/intl.dart';

import '../../../constant/app_color.dart';
import '../../../helper/text_over_mage.dart';
import '../../../helper/text_style.dart';
import '../../../utils/screen_size.dart';

class EventsListTileWidget extends StatelessWidget {
  const EventsListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int length = eventsList.length > 3 ? 3 : eventsList.length;
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
        for (var i = 0; i < length; i++) EventCard(index: i)
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.index,
    this.vertical = false,
  }) : super(key: key);

  final int index;
  final bool vertical;

  String convertDate(DateTime date) {
    // date = date.toLocal();
    String formattedDate = DateFormat('dd MMM yy').format(date);
    String formattedTime = DateFormat('h:ma').format(date);
    return "${formattedDate} • ${formattedTime}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: vertical
          ? Column(
              children: [
                LocationWidget(
                    location: eventsList[index].location,
                    isOnline: eventsList[index].isVirtual),
                _buildImage(context),
                SizedBox(height: 10),
                _buildDetail(context),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 4,
                  child: _buildImage(context),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 5,
                  child: _buildDetail(context),
                ),
              ],
            ),
    );
  }

  Widget _buildDetail(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) * (vertical ? 0.1 : 0.13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!vertical)
            LocationWidget(
                location: eventsList[index].location,
                isOnline: eventsList[index].isVirtual),
          Text(
            eventsList[index].title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleHelper.t18b700(),
          ),
          // SizedBox(height: 5),
          Text(
            "Event By",
            style: TextStyleHelper.t12b600().copyWith(
              color: AppColor.darkBlue.withOpacity(.6),
            ),
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColor.secondaryColor.withOpacity(.5),
                    width: 1,
                  ),
                ),
                child: CircleAvatar(
                  // radius: 40,
                  backgroundImage:
                      NetworkImage(eventsList[index].eventBy.profileImage),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                eventsList[index].eventBy.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleHelper.t14b600().copyWith(
                  color: AppColor.darkBlue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImage(
    context,
  ) {
    return Container(
      height: screenHeight(context) * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.primaryColor,
        image: DecorationImage(
          image: NetworkImage(eventsList[index].imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: TextOverImage(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        title: convertDate(eventsList[index].dateTime),
        style: TextStyleHelper.t14b700().copyWith(
          color: AppColor.white,
        ),
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
    required this.location,
    required this.isOnline,
  }) : super(key: key);

  final String location;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: AppColor.primaryColor,
        ),
        // SizedBox(width: 10),
        Text(
          isOnline ? "Online" : location,
          style: TextStyleHelper.t14b600().copyWith(
            color: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }
}
