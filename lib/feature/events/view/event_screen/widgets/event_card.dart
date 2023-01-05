import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../constant/app_color.dart';
import '../../../../../helper/text_over_mage.dart';
import '../../../../../helper/text_style.dart';
import '../../../../../utils/screen_size.dart';
import '../../../../../widgets/icon_text_widget.dart';
import '../../../model/events_model.dart';

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

  String convertDate(DateTime startDate) {
    // date = date.toLocal();
    String formattedDate = DateFormat('dd MMM yy').format(startDate);
    String formattedTime = DateFormat('h:mma').format(startDate);
    return "$formattedDate • $formattedTime";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.eventDetailScreen,
            arguments: eventData);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: vertical
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  showLocation(),
                  const SizedBox(height: 10),
                  _buildImage(context),
                  const SizedBox(height: 10),
                  _buildDetail(context),
                ],
              )
            : Row(
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
      ),
    );
  }

  Widget _buildDetail(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) * (vertical ? 0.1 : 0.14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!vertical) showLocation(),
          Text(
            eventData.name!.trim(),
            maxLines: 2,
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
                    // backgroundImage: NetworkImage(eventData.eventBy.profileImage),
                    ),
              ),
              const SizedBox(width: 10),
              Text(
                // eventData.eventBy.name,
                "name",
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

  IconTextWidget showLocation() {
    return IconTextWidget(
        title: "${eventData.city!}, ${eventData.state!}",
        isOnline: eventData.type == "virtual");
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
          image: NetworkImage(eventData.image!),
          fit: BoxFit.cover,
        ),
      ),
      child: TextOverImage(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        title: convertDate(eventData.startdatetime!),
        style: TextStyleHelper.t14b700().copyWith(
          color: AppColor.white,
        ),
      ),
    );
  }
}
