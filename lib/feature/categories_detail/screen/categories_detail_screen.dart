import 'package:flutter/material.dart';
import 'package:healersandteachers/feature/events/model/events_model.dart';
import 'package:healersandteachers/feature/events/screen/widgets/event_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/routes/routes.dart';
import '../../../constant/app_color.dart';
import '../../../helper/text_style.dart';
import '../../../utils/screen_size.dart';
import '../../categories/model/categories_model.dart';
import '../../home/screen/widgets/practitioners_list.dart';
import '../../paractitioners/model/pracitioners_model.dart';

class CategoriesDetailScreen extends StatefulWidget {
  const CategoriesDetailScreen({super.key, required this.categoriesModel});
  final CategoriesModel categoriesModel;

  @override
  State<CategoriesDetailScreen> createState() => _CategoriesDetailScreenState();
}

class _CategoriesDetailScreenState extends State<CategoriesDetailScreen> {
  late ScrollController _scrollController = ScrollController();
  final ScrollController _mainscrollController = ScrollController();

  late PageController _pageController;
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   // _scrollController
    // });
    _pageController = PageController(
      // start at a high offset so we can scroll backwards:
      initialPage: imageList.length * 9999,
      viewportFraction: 0.8,
    );
    super.initState();
  }

  List<String> imageList = [
    "https://images.unsplash.com/photo-1671436330188-0bfb33687b7b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1671422668840-9af25e9bc5aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1671427801641-187826edfb2a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60",
  ];

  // double get _currentOffset {
  //   bool inited =
  //       _pageController.hasClients && _pageController.position.haveDimensions;
  //   return inited ? _pageController.page! : _pageController.initialPage * 1.0;
  // }

  // int get _currentIndex => _currentOffset.round() % imageList.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoriesModel.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // controller: _mainscrollController,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: screenWidth(context) * 0.4,
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    print("index $index");
                    print(
                        "index % imageList.length ${index % imageList.length}");
                    // bool isCurrentIndex =
                    //     index % imageList.length == _currentIndex;
                    return Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 16 : 5.0,
                        right: index == 4 ? 16 : 5,
                      ),
                      width: screenWidth(context) * .8,
                      // height: screenWidth(context) * 0.3,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image:
                              NetworkImage(imageList[index % imageList.length]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              SmoothPageIndicator(
                controller: _pageController,
                count: imageList.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColor.secondaryColor,
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 2,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                width: double.infinity,
                height: screenWidth(context) * 0.4,
                child: RawScrollbar(
                  controller: _scrollController,
                  trackRadius: const Radius.circular(10),
                  thumbVisibility: true,
                  thickness: 10,
                  radius: const Radius.circular(10),
                  trackVisibility: true,
                  trackBorderColor: Colors.transparent,
                  thumbColor: AppColor.secondaryColor,
                  trackColor: AppColor.grey.withOpacity(0.2),
                  // showTrackOnHover: true,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Sed consequat eget tellus eget ullamcorper. Sed finibus  cursus turpis et pellentesque. Suspendisse sollicitudin  posuere nunc, eu pharetra diam ornare vitae.Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Sed consequat eget tellus eget ullamcorper. Sed finibus  cursus turpis et pellentesque. Suspendisse sollicitudin  posuere nunc, eu pharetra diam ornare vitae.Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Sed consequat eget tellus eget ullamcorper. Sed finibus  cursus turpis et pellentesque. Suspendisse sollicitudin  posuere nunc, eu pharetra diam ornare vitae. ",
                        style: TextStyleHelper.t14b400()
                            .copyWith(color: AppColor.grey, height: 1.3),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nearby Practitioners",
                      style: TextStyleHelper.t20b700(),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, Routes.practitionerScreen);
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
              Container(
                // color: Colors.yellow,
                child: GridView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                  ),
                  children: [
                    ...List.generate(
                      getPractitioners.length > 4 ? 4 : getPractitioners.length,
                      (index) => PractitionersCard(
                        data: getPractitioners[index],
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
                        // Navigator.pushNamed(context, Routes.practitionerScreen);
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
              GridView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 5,
                ),
                children: [
                  ...List.generate(
                    getPractitioners
                        .length, //> 4 ? 4 : getPractitioners.length,
                    (index) => EventCard(
                      eventData: eventsList[index],
                      vertical: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
