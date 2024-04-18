// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/constant.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/views/bottom_nav_bar/bottom_nav_bar_viewmodel.dart';
import 'package:interpretbot/views/profile/profile_view.dart';
import 'package:interpretbot/views/simultaneous_interpretation/simultaneous_interpretation_view.dart';
import 'package:interpretbot/views/test/test_view1.dart';

class BottomNavBarView extends StatelessWidget {
  BottomNavBarView({super.key});

  final BottomNavBarViewModel viewModel = Get.put(BottomNavBarViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          imgWhiteLogo,
          height: 34,
          width: 34,
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: SvgPicture.asset(
          //     icListeningLines,
          //     color: ThemeColors.bgColor,
          //     height: 24,
          //     width: 24,
          //   ),
          // ),
          IconButton(
            onPressed: () {
              Get.to(() => ProfileView());
            },
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
        bottom: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Simultaneous Interpretation",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: ThemeColors.bgColor,
            ),
          ),
        ),
      ),
      body: GetBuilder<BottomNavBarViewModel>(
        id: "bottomNavBar",
        builder: (ctrl) => bodyList[viewModel.bottomIndex],
      ),
      bottomNavigationBar: GetBuilder<BottomNavBarViewModel>(
        id: "bottomNavBar",
        builder: (ctrl) => BottomNavigationBar(
          currentIndex: ctrl.bottomIndex,
          onTap: (value) => {
            ctrl.bottomIndexValue = value,
            if (value == 1)
              {
                Get.to(() => TestView1()),
              }
          },
          type: BottomNavigationBarType.fixed,
          elevation: 15,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
              label: "",
              activeIcon: SvgPicture.asset(
                icHeadphones,
                color: ThemeColors.black1,
                height: 24,
                width: 24,
              ),
              icon: SvgPicture.asset(
                icHeadphones,
                color: ThemeColors.mainColor,
                height: 24,
                width: 24,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              activeIcon: SvgPicture.asset(
                icGlobe,
                color: ThemeColors.black1,
                height: 24,
                width: 24,
              ),
              icon: SvgPicture.asset(
                icGlobe,
                color: ThemeColors.mainColor,
                height: 24,
                width: 24,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              activeIcon: SvgPicture.asset(
                icMobile,
                color: ThemeColors.black1,
                height: 24,
                width: 24,
              ),
              icon: SvgPicture.asset(
                icMobile,
                color: ThemeColors.mainColor,
                height: 24,
                width: 24,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              activeIcon: SvgPicture.asset(
                icCamera,
                color: ThemeColors.black1,
                height: 24,
                width: 24,
              ),
              icon: SvgPicture.asset(
                icCamera,
                color: ThemeColors.mainColor,
                height: 24,
                width: 24,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              activeIcon: SvgPicture.asset(
                icLanguage,
                color: ThemeColors.black1,
                height: 24,
                width: 24,
              ),
              icon: SvgPicture.asset(
                icLanguage,
                color: ThemeColors.mainColor,
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> bodyList = [
    SimultaneousInterpretationView(),
    Container(),
    Container(
      color: ThemeColors.yellow,
    ),
    Container(
      color: ThemeColors.red,
    ),
    Container(
      color: ThemeColors.chocolate,
    ),
  ];
}
