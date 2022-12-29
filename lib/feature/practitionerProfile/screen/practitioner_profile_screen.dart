import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healersandteachers/constant/api_path.dart';
import 'package:healersandteachers/constant/app_color.dart';
import 'package:healersandteachers/helper/text_style.dart';
import 'package:healersandteachers/utils/screen_size.dart';
import 'package:healersandteachers/widgets/icon_text_widget.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../widgets/chip.dart';
import '../../events/model/events_model.dart';
import '../../events/screen/widgets/event_card.dart';
import '../../paractitioners/model/pracitioners_model.dart';
import '../../paractitioners/providers/paractitioners_provider.dart';

class PractitionerProfileScreen extends StatefulWidget {
  const PractitionerProfileScreen({super.key, required this.practitionerData});

  final PractitionersModel practitionerData;

  @override
  State<PractitionerProfileScreen> createState() =>
      _PractitionerProfileScreenState();
}

class _PractitionerProfileScreenState extends State<PractitionerProfileScreen> {
  late PractitionersModel memberData;
  bool isLoading = true;
  @override
  void initState() {
    Provider.of<PractitionersProvider>(context, listen: false)
        .fetchPractitioners(widget.practitionerData.username!)
        .then((value) {
      setState(() {
        memberData = value!;
      });
    }).whenComplete(() => setState(() {
              isLoading = false;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as PractitionersModel;
    // log(practitionerData.name);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: screenWidth(context),
                height: screenWidth(context) * 0.7,
                padding: const EdgeInsets.only(left: 10, top: 10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage(
                        ApiPath.serverDomain + widget.practitionerData.image!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${widget.practitionerData.firstName!} ${widget.practitionerData.lastName!}",
                            style: TextStyleHelper.t18b700(),
                          ),
                        ),
                        OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            label: const Text("Follow")),
                      ],
                    ),
                    Text(
                      widget.practitionerData.title!,
                      style: TextStyleHelper.t14b600().copyWith(
                        color: AppColor.grey,
                      ),
                    ),
                    if (!isLoading)
                      Wrap(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        spacing: 10,
                        children: [
                          ...List.generate(
                            memberData.wellnesskeywords!.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.5),
                              child: CustomChip(
                                  title: memberData
                                      .wellnesskeywords![index].name!),
                            ),
                          ),
                        ],
                      ),
                    // const SizedBox(height: 10),
                    IconTextWidget(
                      title:
                          "${widget.practitionerData.city!}, ${widget.practitionerData.state!}",
                      isOnline: false,
                      color: AppColor.grey,
                    ),
                    titleText("About"),
                    Text(
                      widget.practitionerData.aboutme!,
                      style: TextStyleHelper.t14b400()
                          .copyWith(color: AppColor.grey, height: 1.4),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          contactBottomSheet(context, widget.practitionerData);
                        },
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Contact ${widget.practitionerData.firstName}",
                              style: TextStyleHelper.t18b700().copyWith(
                                color: AppColor.primaryColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.arrow_forward_rounded,
                                color: AppColor.primaryColor),
                          ],
                        ),
                      ),
                    ),
                    titleText("Services"),
                    ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 10),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ServicesTile(
                            practitionerData: getPractitioners.first);
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 30,
                          thickness: 1,
                        );
                      },
                      itemCount: 3,
                    ),
                    titleText("Events"),
                    EventCard(eventData: eventsList[0]),
                    titleText("Reviews"),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 10),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const ReviewTile();
                      },
                      itemCount: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> contactBottomSheet(
      BuildContext context, PractitionersModel memberData) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Contact Me",
                  style: TextStyleHelper.t24b700(),
                ),
                Flexible(
                  child: ListTile(
                    // contentPadding: EdgeInsets.zero,
                    // horizontalTitleGap: 0,
                    leading: const Icon(Icons.phone),
                    title: Text("+" + memberData.phoneno!),
                    onTap: () {},
                  ),
                ),
                Flexible(
                  child: ListTile(
                    leading: const Icon(Icons.mail),
                    title: Text(memberData.email!),
                    onTap: () {},
                  ),
                ),
                if (memberData.physicaladdress != "undefined")
                  ListTile(
                    leading: const Icon(Icons.location_city),
                    title: Text(memberData.physicaladdress!),
                    onTap: () {},
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.facebookF),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.twitter),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.instagram),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.linkedin),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget titleText(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Divider(height: 0, thickness: 1),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 8),
          child: Text(
            title,
            style: TextStyleHelper.t20b700(),
          ),
        ),
      ],
    );
  }
}

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.primaryColor.withOpacity(.12),
            radius: 30,
            backgroundImage: const NetworkImage(
                "https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John Doe",
                  style: TextStyleHelper.t16b700(),
                ),
                const SizedBox(height: 5),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Sed consequat eget tellus eget ullamcorper. Sed finibus  cursus turpis et pellentesque. Suspendisse sollicitudin  posuere nunc, eu pharetra diam ornare vitae.",
                  style:
                      TextStyleHelper.t14b400().copyWith(color: AppColor.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
