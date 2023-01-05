import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_color.dart';
import '../../../helper/text_style.dart';
import '../../../widgets/chip.dart';
import '../../../widgets/location_tile.dart';
import '../Provider/events_provider.dart';
import '../model/events_model.dart';
import 'widgets/event_card.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  bool isPageLoading = true;

  final ScrollController _scrollController = ScrollController();

  bool hasMore = true;
  bool isFetching = false;
  int page = 0;
  int dataLimit = 5;

  @override
  void initState() {
    final EventProvider p = Provider.of<EventProvider>(context, listen: false);

    p.fetchAllEventsList(clearData: true).whenComplete(() {
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

  fetch(EventProvider p) {
    if (!isFetching) {
      setState(() {
        isFetching = true;
      });
      log("refreshing ${page * dataLimit}, ${p.eventsList.length}, ${p.eventsData.count!}");

      if (p.eventsList.length >= p.eventsData.count!) {
        hasMore = false;
        log("no more data $hasMore");

        setState(() {});
        return;
      }
      page++;
      log("fetching ${page * dataLimit}");
      p.fetchAllEventsList(offset: page * dataLimit).whenComplete(() {
        setState(() {
          isPageLoading = false;
          isFetching = false;
        });
      });
      // setState(() {});
    }
  }

  Future<void> _refreshData(EventProvider p) async {
    await p.fetchAllEventsList(clearData: true);
    log("refreshing ${page * dataLimit}, ${p.eventsList.length}, ${p.eventsData.count!}");

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
          title: const Text("Events"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const LocationTile(),
                // const SizedBox(height: 20),
                Expanded(
                  child: isPageLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Consumer<EventProvider>(builder: (context, p, child) {
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const Text(" "),
                                    Expanded(
                                      child: Wrap(
                                        spacing: 10,
                                        children: List.generate(
                                          2,
                                          (index) => CustomChip(
                                            title: "All",
                                            labelColor: AppColor.white,
                                            onDeleted: () {},
                                            backgroundColor:
                                                AppColor.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // CustomChip(
                                    //   title: "All",
                                    //   labelColor: AppColor.white,
                                    //   onDeleted: () {},
                                    //   backgroundColor: AppColor.primaryColor,
                                    // ),
                                    OutlinedButton.icon(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          // primary: AppColor.primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          side: const BorderSide(
                                              color: AppColor.primaryColor),
                                        ),
                                        icon: const Icon(Icons.filter_list),
                                        label: Text("Filter",
                                            style: TextStyleHelper.t16b600()
                                                .copyWith(
                                              color: AppColor.primaryColor,
                                            ))),
                                  ],
                                ),
                              ),

                              // NOTE: Event User info not on api
                              Expanded(
                                child: RefreshIndicator(
                                  onRefresh: () => _refreshData(p),
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    itemCount: p.eventsList.length + 1,
                                    itemBuilder: (context, index) {
                                      if (index < p.eventsList.length) {
                                        final data = p.eventsList[index];
                                        return EventCard(eventData: data);
                                      } else {
                                        return !isFetching
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : const SizedBox();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                ),
              ],
            ),
          ),
        ));
  }
}
