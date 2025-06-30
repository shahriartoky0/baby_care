import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';
import 'package:together_baby/views/screens/home/home_screen.dart';

import '../../utilities/app_colors.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  // final List<IconData> _icons = <IconData>[
  //   Icons.home_outlined,
  //   Icons.notifications_none_outlined,
  //   Icons.chat_bubble_outline_rounded,
  //   Icons.bookmark_add_outlined,
  //   Icons.account_circle_outlined,
  // ];

  // final List<IconData> _filledIcons = <IconData>[
  //   Icons.home,
  //   Icons.notifications,
  //   Icons.chat_bubble_rounded,
  //   Icons.bookmark,
  //   Icons.account_circle,
  // ];
  // final List<String> _filledIcons = <String>[
  //   AppIcons.navHomeIcon,
  //   AppIcons.navHomeIcon,
  //   AppIcons.calendarIcon,
  //   AppIcons.milestoneIcon,
  //   AppIcons.profileIcon,
  // ];
  final List<String> _icons = <String>[
    AppIcons.navHomeIcon,
    AppIcons.navBabyIcon,
    AppIcons.calendarIcon,
    AppIcons.milestoneIcon,
    AppIcons.profileIcon,
  ];
  final List<String> labels = <String>['Home', 'Baby Care', 'Planner', 'Milestone', 'Profile'];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        itemCount: _screens.length,
        itemBuilder: (BuildContext context, int index) {
          return _screens[index];
        },
      ),
      bottomNavigationBar: Container(
        child: BottomAppBar(
          color: AppColors.appBarColor,
          // color: AppColors.white,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_icons.length, (int index) {
              return GestureDetector(
                onTap: () {
                  // _pageController.animateToPage(
                  //   index,
                  //   duration: const Duration(milliseconds: 500),
                  //   curve: Curves.easeInOut,
                  // );

                  _pageController.jumpToPage(index);
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    // color: AppColors.white,
                    color: AppColors.appBarColor,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: selectedIndex == index ? const Offset(0, 5) : Offset.zero,
                        color: AppColors.primaryColor,
                      ),
                    ],
                    border: Border.all(
                      color: selectedIndex == index ? AppColors.black : Colors.transparent,
                    ),
                    // border: Border(
                    //   top: BorderSide(
                    //     color: AppColors.primaryColor,
                    //     width: selectedIndex == index ? 3 : 0,
                    //   ),
                    // ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // child: Icon(
                  //   selectedIndex == index ? _filledIcons[index] : _icons[index],
                  //   color: Colors.black87,
                  // ),
                  child: CustomSvgImage(
                    height: selectedIndex == index ? 32 :28,
                    assetName:  _icons[index],
                    color: selectedIndex == index ? AppColors.primaryColor : Colors.grey,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
