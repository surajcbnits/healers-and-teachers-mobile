import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healersandteachers/feature/paractitioners/providers/paractitioners_provider.dart';
import 'package:healersandteachers/feature/services/model/services_model.dart';
import 'package:healersandteachers/feature/services/provider/service_provider.dart';
import 'package:healersandteachers/utils/text_data_check.dart';
import 'package:healersandteachers/utils/toCapitalized.dart';

import 'package:provider/provider.dart';

import '../../../../constant/app_color.dart';
import '../../../../helper/text_style.dart';
import '../../../../utils/location.dart';
import '../../../../utils/screen_size.dart';
import '../../../../widgets/chip.dart';
import '../../../../widgets/icon_text_widget.dart';
import '../../../events/Provider/events_provider.dart';
import '../../../events/model/events_model.dart';
import '../../../events/view/event_screen/widgets/event_card.dart';
import '../../model/pracitioners_model.dart';
import 'components/review_tile.dart';
import '../../../services/view/service_tile.dart';

class PractitionerProfileScreen extends StatefulWidget {
  const PractitionerProfileScreen({super.key, required this.practitionerData});

  final MemberDetails practitionerData;

  @override
  State<PractitionerProfileScreen> createState() =>
      _PractitionerProfileScreenState();
}

class _PractitionerProfileScreenState extends State<PractitionerProfileScreen> {
  late MemberDetails memberData;
  late List<EventDetails> eventList;
  late ServiceDataModel serviceData;
  bool isLoading = true;
  bool isEventLoading = true;
  bool isServiceLoading = true;

  @override
  void initState() {
    memberData = widget.practitionerData;
    _getData();
    super.initState();
  }

  _getData() {
    /// Get user Data
    // Provider.of<PractitionersProvider>(context, listen: false)
    //     .fetchPractitioners(widget.practitionerData.username!)
    //     .then((value) {
    //   setState(() => memberData = value!);
    // }).whenComplete(() => setState(() => isLoading = false));

    /// Get Event Data
    Provider.of<EventProvider>(context, listen: false)
        .fetchUserEvents(widget.practitionerData.username!)
        .then((value) {
      setState(() => eventList = value!);
    }).whenComplete(() => setState(() => isEventLoading = false));

    /// Get service Data
    Provider.of<ServiceProvider>(context, listen: false)
        .fetchServiceByUser(widget.practitionerData.username!)
        .then((value) {
      setState(() => serviceData = value!);
    }).whenComplete(() => setState(() => isServiceLoading = false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            //  isLoading
            //     ? const Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     :
            SingleChildScrollView(
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
                    image: NetworkImage(memberData.image!),
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
                            "${memberData.firstName!} ${memberData.lastName!}",
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
                      memberData.title!,
                      style: TextStyleHelper.t14b600().copyWith(
                        color: AppColor.grey,
                      ),
                    ),
                    if (memberData.wellnessKeywords != null)
                      Wrap(
                        spacing: 10,
                        children: [
                          ...List.generate(
                            memberData.wellnessKeywords!.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.5),
                              child: CustomChip(
                                  title: memberData
                                      .wellnessKeywords![index].name!),
                            ),
                          ),
                        ],
                      ),
                    IconTextWidget(
                      title: locationString(
                        city: memberData.city!,
                        state: memberData.state!,
                        country: memberData.country!,
                      ),
                      isOnline: false,
                      color: AppColor.grey,
                    ),
                    titleText("About"),
                    Text(
                      memberData.aboutme!,
                      style: TextStyleHelper.t14b400()
                          .copyWith(color: AppColor.grey, height: 1.4),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          contactBottomSheet(context, memberData);
                        },
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Contact ${memberData.firstName}",
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
                    if (isServiceLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ServicesTile(
                              serviceData: serviceData.serviceDataList![index]);
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 30,
                            thickness: 1,
                          );
                        },
                        itemCount: serviceData.serviceDataList!.length,
                      ),
                    if (memberData.qualification != "undefined") ...[
                      titleText("Training & Credentials"),
                      Text(
                        memberData.qualification!,
                        style: TextStyleHelper.t14b400()
                            .copyWith(color: AppColor.grey, height: 1.4),
                      ),
                    ],
                    titleText("Events"),
                    if (isEventLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      ...List.generate(
                        eventList.length,
                        (index) => EventCard(eventDetail: eventList[index]),
                      ),

                    // EventCard(eventData: eventsList[0]),
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
      BuildContext context, MemberDetails memberData) {
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
                if (CheckData.isNotNull(memberData.phoneno!))
                  Flexible(
                    child: ListTile(
                      // contentPadding: EdgeInsets.zero,
                      // horizontalTitleGap: 0,
                      leading: const Icon(Icons.phone),
                      title: Text(memberData.phoneno!),
                      onTap: () {},
                    ),
                  ),
                if (CheckData.isNotNull(memberData.email!))
                  Flexible(
                    child: ListTile(
                      leading: const Icon(Icons.mail),
                      title: Text(memberData.email!),
                      onTap: () {},
                    ),
                  ),
                if (CheckData.isNotNull(memberData.physicaladdress!))
                  ListTile(
                    leading: const Icon(Icons.location_city),
                    title: Text(memberData.physicaladdress!),
                    onTap: () {},
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (CheckData.isNotNull(memberData.facebook!))
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.facebookF),
                      ),
                    if (CheckData.isNotNull(memberData.twitter!))
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.twitter),
                      ),
                    if (CheckData.isNotNull(memberData.instagram!))
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.instagram),
                      ),
                    //  if (memberData.lin != "undefined" &&
                    //     memberData.lin!.isNotEmpty)
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const FaIcon(FontAwesomeIcons.linkedin),
                    // ),
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
            style: TextStyleHelper.t24b700(),
          ),
        ),
      ],
    );
  }
}
