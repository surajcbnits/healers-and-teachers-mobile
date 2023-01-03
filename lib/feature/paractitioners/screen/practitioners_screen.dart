import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:healersandteachers/helper/text_style.dart';
import 'package:provider/provider.dart';

import '../../../config/routes/routes.dart';
import '../../../constant/app_color.dart';
import '../../../widgets/chip.dart';
import '../../../widgets/icon_text_widget.dart';
import '../model/pracitioners_model.dart';
import '../providers/paractitioners_provider.dart';

class PractitionerScreen extends StatefulWidget {
  const PractitionerScreen({super.key});

  @override
  State<PractitionerScreen> createState() => _PractitionerScreenState();
}

class _PractitionerScreenState extends State<PractitionerScreen> {
  ScrollController _scrollController = ScrollController();
  bool isPageLoading = true;

  bool hasMore = true;
  bool isFetching = false;
  int page = 0;

  @override
  void initState() {
    final PractitionersProvider p =
        Provider.of<PractitionersProvider>(context, listen: false);
    p.getMemberData(clearData: true).whenComplete(() {
      setState(() {
        isPageLoading = false;
      });
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetch(p);
      }
    });
    super.initState();
  }

  fetch(PractitionersProvider p) {
    if (!isFetching) {
      isFetching = true;

      if (p.memberDataList.length >= p.practitionersData.count!) {
        hasMore = false;
        setState(() {});
        return;
      }
      page++;
      log("fetching ${page * 5}");
      p.getMemberData(offset: page * 5).whenComplete(() {
        setState(() {
          isPageLoading = false;
          isFetching = false;
        });
      });
      setState(() {});
    }
  }

  Future<void> _refreshData(PractitionersProvider p) async {
    await p.getMemberData(clearData: true);
    setState(() {
      hasMore = true;
      isFetching = false;
      page = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practitioners'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: isPageLoading
            ? const Center(child: CircularProgressIndicator())
            : Consumer<PractitionersProvider>(builder: (context, p, child) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${p.memberDataList.length} Practitioners",
                          style: TextStyleHelper.t14b600().copyWith(
                            color: AppColor.grey,
                          ),
                        ),
                        OutlinedButton.icon(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              // primary: AppColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              side: const BorderSide(
                                  color: AppColor.primaryColor),
                            ),
                            icon: const Icon(Icons.filter_list),
                            label: Text("Filter",
                                style: TextStyleHelper.t16b600().copyWith(
                                  color: AppColor.primaryColor,
                                ))),
                      ],
                    ),
                    // TODO:
                    // need to sort the list according to the distance
                    // and first show the nearest one if many are available
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () => _refreshData(p),
                        child: ListView.separated(
                            // shrinkWrap: true,
                            controller: _scrollController,
                            itemCount: p.memberDataList.length + 1,
                            separatorBuilder: (context, index) {
                              return const Divider(
                                height: 20,
                                thickness: 1,
                              );
                            },
                            itemBuilder: (context, index) {
                              if (index < p.memberDataList.length) {
                                final PractitionersModel data =
                                    p.memberDataList[index];
                                return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          Routes.practitionerProfileScreen,
                                          arguments: data);
                                    },
                                    child: PractitionerListCard(data: data));
                              } else {
                                return Center(
                                    child: hasMore
                                        ? const CircularProgressIndicator()
                                        : const Text("No Practitioners"));
                              }
                            }),
                      ),
                    ),
                  ],
                );
              }),
      )),
    );
  }
}

class PractitionerListCard extends StatelessWidget {
  const PractitionerListCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final PractitionersModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: AppColor.primaryColor.withOpacity(.12),
          radius: 45,
          backgroundImage: NetworkImage(data.image!),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${data.firstName!} ${data.lastName!}",
                style: TextStyleHelper.t18b700(),
              ),
              Text(
                data.title!,
                style: TextStyleHelper.t14b600().copyWith(
                  // height: 1.2,
                  color: AppColor.grey,
                ),
              ),
              // Row(
              //   children: [
              //     ...List.generate(
              //       data.keyWords.length,
              //       (index) => Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 2.5),
              //         child: CustomChip(title: data.keyWords[index]),
              //       ),
              //     ),
              //   ],
              // ),
              const IconTextWidget(
                isOnline: false,
                title: "7893 Miles",
                color: AppColor.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
