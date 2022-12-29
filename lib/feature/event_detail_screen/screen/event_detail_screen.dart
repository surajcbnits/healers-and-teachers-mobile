import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:healersandteachers/config/routes/routes.dart';
import 'package:healersandteachers/helper/text_style.dart';
import 'package:healersandteachers/utils/screen_size.dart';
import 'package:healersandteachers/widgets/chip.dart';
import 'package:intl/intl.dart';

import '../../../constant/app_color.dart';
import '../../../widgets/circular_profile.dart';
import '../../../widgets/read_more_text.dart';
import '../../events/model/events_model.dart';
import '../../paractitioners/model/pracitioners_model.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({super.key, required this.eventData});
  final EventModel eventData;

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  String convertDate(DateTime date) {
    // date = date.toLocal();
    String formattedDate = DateFormat('EEEE, MMMM dd yyyy').format(date);
    // String formattedTime = DateFormat('h:ma').format(date);
    return "${formattedDate}";
  }

  String convertTime(DateTime date) {
    // date = date.toLocal();
    // 7:00  AM To 8:00 AM PST
    String formattedTime = DateFormat('h:mm a').format(date);
    return "${formattedTime} To ${formattedTime} PST";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event"),
      ),
      bottomNavigationBar: Container(
        // height: screenHeight(context) * .12,
        padding: EdgeInsetsDirectional.fromSTEB(
            16, 16, 16, mediaQuerySize(context).padding.bottom + 10),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColor.darkBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      r"$25" " - " r"$50",
                      style: TextStyleHelper.t24b700().copyWith(
                        color: AppColor.white,
                      ),
                    ),
                    Text(
                      "(Sliding Scale)",
                      style: TextStyleHelper.t14b700().copyWith(
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.bookingScreen);
                  },
                  icon: const Icon(Icons.star_rounded),
                  label: Text(
                    "Interested",
                    style: TextStyleHelper.t14b700()
                        .copyWith(color: AppColor.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenWidth(context) * .4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(widget.eventData.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.eventData.title,
                  style: TextStyleHelper.t24b700(),
                ),
                const SizedBox(height: 10),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Sed consequat eget tellus eget ullamcorper.",
                  style: TextStyleHelper.t14b400().copyWith(
                    color: AppColor.grey,
                  ),
                ),
                CustomListTile(
                  title: convertDate(widget.eventData.dateTime),
                  subtitle: convertTime(widget.eventData.dateTime),
                  // leadingIcon: Icons.calendar_today,
                ),
                const CustomListTile(
                  title: "Yoga For The People ",
                  subtitle: "1601 Store ST, San Franciso, CA 94107",
                  leadingIcon: Icons.location_on_outlined,
                ),
                EventPractitionerInterestTile(widget: widget),
                const SizedBox(height: 20),
                Text(
                  "About",
                  style: TextStyleHelper.t18b700(),
                ),
                const SizedBox(height: 10),
                const ReadMoreText(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventPractitionerInterestTile extends StatelessWidget {
  const EventPractitionerInterestTile({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final EventDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          height: screenWidth(context) * 0.17,
          // color: Colors.red,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OuterCircularProfile(
                radius: screenWidth(context) * 0.17,
                image: NetworkImage(widget.eventData.imageUrl),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amanda Harris",
                    style: TextStyleHelper.t14b600(),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Certified yoga teacher",
                    style: TextStyleHelper.t14b400().copyWith(
                      color: AppColor.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const VerticalDivider(
                color: AppColor.grey,
                thickness: 1,
                // width: 20,
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Interested",
                    style: TextStyleHelper.t14b600(),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    // fit: StackFit.expand,
                    // alignment: Alignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(3, (index) {
                        return Align(
                          widthFactor: 0.6,
                          child: CircularProfile(
                            radius: 12,
                            showShadow: false,
                            image: NetworkImage(widget.eventData.imageUrl),
                          ),
                        );
                      }),
                      Align(
                        widthFactor: 0.6,
                        child: CircularProfile(
                          radius: 12,
                          showShadow: false,
                          backgroundColor: AppColor.primaryColor,
                          child: Text(
                            "5+",
                            style: TextStyleHelper.t14b600(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            ...List.generate(
              getPractitioners[0].keyWords.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child:
                    CustomChip(title: getPractitioners[index].keyWords[index]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.greyLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              leadingIcon ?? Icons.calendar_today,
              color: AppColor.darkBlue,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyleHelper.t14b600(),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    subtitle,
                    style: TextStyleHelper.t14b600(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Icon(
              trailingIcon ?? Icons.arrow_forward_ios_rounded,
              color: AppColor.darkBlue,
            ),
          ],
        ),
      ),
    );
  }
}
