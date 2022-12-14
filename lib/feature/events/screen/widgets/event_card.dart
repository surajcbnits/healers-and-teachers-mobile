import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constant/app_color.dart';
import '../../../../helper/text_over_mage.dart';
import '../../../../helper/text_style.dart';
import '../../../../utils/screen_size.dart';
import '../../../../widgets/icon_text_widget.dart';
import '../../model/events_model.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    // required this.index,
    this.vertical = false,
    required this.eventData,
  }) : super(key: key);

  // final int index;
  final bool vertical;
  final EventModel eventData;

  String convertDate(DateTime date) {
    // date = date.toLocal();
    String formattedDate = DateFormat('dd MMM yy').format(date);
    String formattedTime = DateFormat('h:ma').format(date);
    return "${formattedDate} • ${formattedTime}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: vertical
          ? Column(
              children: [
                IconTextWidget(
                    location: eventData.location,
                    isOnline: eventData.isVirtual),
                _buildImage(context),
                const SizedBox(height: 10),
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
            IconTextWidget(
                location: eventData.location, isOnline: eventData.isVirtual),
          Text(
            eventData.title,
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
                  backgroundImage: NetworkImage(eventData.eventBy.profileImage),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                eventData.eventBy.name,
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
          image: NetworkImage(eventData.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: TextOverImage(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        title: convertDate(eventData.dateTime),
        style: TextStyleHelper.t14b700().copyWith(
          color: AppColor.white,
        ),
      ),
    );
  }
}
