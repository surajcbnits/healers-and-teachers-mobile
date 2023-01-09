import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/events/model/events_model.dart';
import 'package:healersandteachers/feature/events/view/event_screen/widgets/event_card.dart';
import 'package:healersandteachers/widgets/read_more_text.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/routes/routes.dart';
import '../../../../constant/app_color.dart';
import '../../../../helper/text_style.dart';
import '../../../../utils/screen_size.dart';
import '../../../home/view/widgets/practitioners_list.dart';
import '../../model/categories_model.dart';
import '../../../paractitioners/model/pracitioners_model.dart';
import '../../provider/categories_provider.dart';

class CategoriesDetailScreen extends StatefulWidget {
  const CategoriesDetailScreen({super.key, required this.categoryData});
  final CategoriesDataModel categoryData;

  @override
  State<CategoriesDetailScreen> createState() => _CategoriesDetailScreenState();
}

class _CategoriesDetailScreenState extends State<CategoriesDetailScreen> {
  late ScrollController _scrollController = ScrollController();
  final ScrollController _mainscrollController = ScrollController();

  bool isLoading = true;
  CategoriesDataModel? category;
  @override
  void initState() {
    Provider.of<CategoriesProvider>(context, listen: false)
        .fetchCategoryById(widget.categoryData.id!)
        .then((value) {
      setState(() => category = value);
    }).whenComplete(() => setState(() => isLoading = false));
    super.initState();
  }

  // late PageController _pageController;
  // @override
  // void initState() {
  // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //   // _scrollController
  // });
  // _pageController = PageController(
  //   // start at a high offset so we can scroll backwards:
  //   initialPage: imageList.length * 9999,
  //   viewportFraction: 1,
  // );
  //   super.initState();
  // }

  // List<String> imageList = [
  // "https://images.unsplash.com/photo-1671436330188-0bfb33687b7b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60",
  // "https://images.unsplash.com/photo-1671422668840-9af25e9bc5aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60",
  // "https://images.unsplash.com/photo-1671427801641-187826edfb2a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60",
  // ];

  // double get _currentOffset {
  //   bool inited =
  //       _pageController.hasClients && _pageController.position.haveDimensions;
  //   return inited ? _pageController.page! : _pageController.initialPage * 1.0;
  // }

  // int get _currentIndex => _currentOffset.round() % imageList.length;

  @override
  Widget build(BuildContext context) {
    // imageList.add
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryData.name!),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // controller: _mainscrollController,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: screenWidth(context) * 0.4,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image:
                        // NetworkImage(imageList[index % imageList.length]),
                        NetworkImage(widget.categoryData.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Container(
              //   width: double.infinity,
              //   height: screenWidth(context) * 0.4,
              //   child: PageView.builder(
              //     controller: _pageController,
              //     scrollDirection: Axis.horizontal,
              //     physics: imageList.length > 1
              //         ? null
              //         : const NeverScrollableScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       // print("index $index");
              //       // print(
              //       //     "index % imageList.length ${index % imageList.length}");
              //       // bool isCurrentIndex =
              //       //     index % imageList.length == _currentIndex;
              //       return Container(
              //         // margin: EdgeInsets.only(
              //         //   left: index == 0 ? 16 : 5.0,
              //         //   right: index == 4 ? 16 : 5,
              //         // ),
              //         width: screenWidth(context) * .8,
              //         // height: screenWidth(context) * 0.3,
              //         decoration: BoxDecoration(
              //           color: AppColor.primaryColor,
              //           borderRadius: BorderRadius.circular(10),
              //           image: DecorationImage(
              //             image:
              //                 // NetworkImage(imageList[index % imageList.length]),
              //                 NetworkImage(widget.category.image!),
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // const SizedBox(height: 10),
              // if (imageList.length > 1)
              //   SmoothPageIndicator(
              //     controller: _pageController,
              //     count: imageList.length,
              //     effect: const ExpandingDotsEffect(
              //       activeDotColor: AppColor.secondaryColor,
              //       dotHeight: 10,
              //       dotWidth: 10,
              //       expansionFactor: 2,
              //     ),
              //   ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              //   width: double.infinity,
              //   height: screenWidth(context) * 0.4,
              //   child: RawScrollbar(
              //     controller: _scrollController,
              //     trackRadius: const Radius.circular(10),
              //     thumbVisibility: true,
              //     thickness: 10,
              //     radius: const Radius.circular(10),
              //     trackVisibility: true,
              //     trackBorderColor: Colors.transparent,
              //     thumbColor: AppColor.secondaryColor,
              //     trackColor: AppColor.grey.withOpacity(0.2),
              //     // showTrackOnHover: true,
              //     child: SingleChildScrollView(
              //       controller: _scrollController,
              //       child: Padding(
              //         padding: const EdgeInsets.only(right: 10.0),
              //         child: Text(
              //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Sed consequat eget tellus eget ullamcorper. Sed finibus  cursus turpis et pellentesque. Suspendisse sollicitudin  posuere nunc, eu pharetra diam ornare vitae.Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Sed consequat eget tellus eget ullamcorper. Sed finibus  cursus turpis et pellentesque. Suspendisse sollicitudin  posuere nunc, eu pharetra diam ornare vitae.Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Sed consequat eget tellus eget ullamcorper. Sed finibus  cursus turpis et pellentesque. Suspendisse sollicitudin  posuere nunc, eu pharetra diam ornare vitae. ",
              //           style: TextStyleHelper.t14b400()
              //               .copyWith(color: AppColor.grey, height: 1.3),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: ReadMoreText(
                  breakingLength: 295,
                  text: widget.categoryData.description!,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Practitioners",
                      style: TextStyleHelper.t20b700(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.practitionerScreen);
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
              if (!isLoading) ...[
                if (category!.memberDetails!.length > 0)
                  Container(
                    // color: Colors.yellow,
                    child: GridView(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.1,
                      ),
                      children: [
                        ...List.generate(
                          category!.memberDetails!.length > 4
                              ? 4
                              : category!.memberDetails!.length,
                          (index) => PractitionersCard(
                            data: category!.memberDetails![index],
                            showDistance: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
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
                //NOTE: Event User info not on api
                if (category!.eventDetails!.length > 0)
                  GridView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.59,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 5,
                    ),
                    children: [
                      ...List.generate(
                        category!.eventDetails!
                            .length, //> 4 ? 4 : getPractitioners.length,
                        (index) => EventCard(
                          eventDetail: category!.eventDetails![index],
                          vertical: true,
                        ),
                      ),
                    ],
                  ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
