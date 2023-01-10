import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/routes/routes.dart';
import '../../../../constant/app_color.dart';
import '../../../../helper/text_style.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/location_tile.dart';
import '../../model/pracitioners_model.dart';
import '../../providers/paractitioners_provider.dart';
import 'components/practitioner_list_tile.dart';

class PractitionerScreen extends StatefulWidget {
  const PractitionerScreen({super.key});

  @override
  State<PractitionerScreen> createState() => _PractitionerScreenState();
}

class _PractitionerScreenState extends State<PractitionerScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isPageLoading = true;

  bool hasMore = true;
  bool isFetching = false;
  int page = 0;
  int dataLimit = 5;

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
      setState(() {
        isFetching = true;
      });
      log("fetching ${page * dataLimit}, ${p.memberDataList.length}, ${p.practitionersData.count!}");

      if (p.memberDataList.length >= p.practitionersData.count!) {
        hasMore = false;
        log("no more data $hasMore");
        setState(() {});
        return;
      }
      if (hasMore) {
        page++;
        log("fetching ${page * dataLimit}");
        p.getMemberData(offset: page * dataLimit).whenComplete(() {
          setState(() {
            isPageLoading = false;
            isFetching = false;
          });
        });
      }
      // setState(() {});
    }
  }

  Future<void> _refreshData(PractitionersProvider p) async {
    await p.getMemberData(clearData: true);
    log("refreshing ${page * dataLimit}, ${p.memberDataList.length}, ${p.practitionersData.count!}");

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
        child: Column(
          children: [
            const LocationTile(),
            Expanded(
              child: isPageLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Consumer<PractitionersProvider>(
                      builder: (context, p, child) {
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.s,
                            children: [
                              Text(
                                "${p.practitionersData.count} Practitioners",
                                style: TextStyleHelper.t14b600().copyWith(
                                  color: AppColor.grey,
                                ),
                              ),
                              FilterButton(
                                onTap: () {},
                              ),
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
                                      final MemberDetails data =
                                          p.memberDataList[index];
                                      return InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context,
                                                Routes
                                                    .practitionerProfileScreen,
                                                arguments: data);
                                          },
                                          child:
                                              PractitionerListCard(data: data));
                                    } else {
                                      return !isFetching
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : const SizedBox();
                                    }
                                  }),
                            ),
                          ),
                        ],
                      );
                    }),
            ),
          ],
        ),
      )),
    );
  }
}
