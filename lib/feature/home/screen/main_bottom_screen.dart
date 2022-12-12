import 'dart:io';

import 'package:flutter/material.dart';

import '../../../constant/app_color.dart';
import '../../../helper/text_style.dart';
import 'home_screen.dart';

class MainBottomScreen extends StatefulWidget {
  const MainBottomScreen({super.key});

  @override
  State<MainBottomScreen> createState() => _MainBottomScreenState();
}

class _MainBottomScreenState extends State<MainBottomScreen> {
  /// Bottom Navigation Starting index
  int currentIndex = 0;

  List<Widget> screenList = [
    const HomeScreen(),
    const Center(child: Text('Search')),
    const Center(child: Text('Calendar')),
    const Center(child: Text('Account')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[currentIndex],
      bottomNavigationBar: BottomAppBar(
          child: Padding(
        padding: EdgeInsets.only(
            top: 10, bottom: Platform.isAndroid ? 10 : 0, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: bottomNavBarIcons
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = e['index'];
                    });
                  },
                  child: BuildNavIcon(
                      icon: e['icon'],
                      label: e['title'],
                      isSelected: e['index'] == currentIndex),
                ),
              )
              .toList(),
        ),
      )),
      // bottomNavigationBar: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     selectedItemColor: AppColor.primaryColor,
      //     unselectedItemColor: AppColor.darkBlue.withOpacity(0.6),
      //     // backgroundColor: AppColor.primaryColor.withOpacity(0.1),
      //     showUnselectedLabels: false,
      //     showSelectedLabels: false,
      //     currentIndex: currentIndex,
      //     onTap: (value) {
      //       print(value);
      //       setState(() {
      //         currentIndex = value;
      //       });
      //     },
      //     items: bottomNavBarIcons
      //         .map((e) => BottomNavigationBarItem(
      //               icon: BuildNavIcon(
      //                   icon: e['icon'],
      //                   label: e['title'],
      //                   isSelected: e['index'] == currentIndex),
      //               label: '',
      //             ))
      //         .toList()),
    );
  }
}

class BuildNavIcon extends StatelessWidget {
  const BuildNavIcon({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    // required this.currentIndex,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColor.primaryColor.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: isSelected
                  ? AppColor.primaryColor
                  : AppColor.darkBlue.withOpacity(0.6)),
          // if (isSelected)
          Text(
            label,
            style: TextStyleHelper.t12b700().copyWith(
                color: isSelected
                    ? AppColor.primaryColor
                    : AppColor.darkBlue.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}

List bottomNavBarIcons = [
  {
    "icon": Icons.home_filled,
    "title": "Home",
    "index": 0,
  },
  {
    "icon": Icons.search,
    "title": "Search",
    "index": 1,
  },
  {
    "icon": Icons.calendar_today,
    "title": "Event",
    "index": 2,
  },
  {
    "icon": Icons.settings_outlined,
    "title": "Account",
    "index": 3,
  },
];
