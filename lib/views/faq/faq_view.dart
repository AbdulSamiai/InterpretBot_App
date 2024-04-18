// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/constant.dart';
import 'package:interpretbot/helper/mySize.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/views/faq/faq_viewmodel.dart';
import 'package:interpretbot/widgets/scrollable_column.dart';

class FaqsView extends StatelessWidget {
  FaqsView({super.key});

  final FaqsViewModel viewModel = Get.put(FaqsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQ"),
      ),
      body: SafeArea(
        child: ScrollableColumn(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: ExpansionTile(
                iconColor: ThemeColors.grey1,
                collapsedIconColor: ThemeColors.grey1,
                tilePadding: EdgeInsets.zero,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: Text(
                  "What the icons represents?",
                  style: TextStyle(
                    color: ThemeColors.black1,
                    fontSize: MySize.size14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Text(
                    "Here is the icons with their name",
                    style: TextStyle(
                      color: ThemeColors.grey1,
                      fontSize: MySize.size12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: MySize.size20),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icHeadphones,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "Simultaneous Interpretation",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icGlobe,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "Online Interpretation",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icMobile,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "Asynchronous Interpretation",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icCamera,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "Photo Translation",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icLanguage,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "Text Translation",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icHeadphones,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "Share",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icHeadphones,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "Copy",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icHeadphones,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "Summary",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icHeadphones,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "To do list",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icHeadphones,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "Voice Recording",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icHeadphones,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "Menu Language",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icHeadphones,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "Subscriptions",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icHeadphones,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "FAQ",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icHeadphones,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "User Support",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          icHeadphones,
                          color: ThemeColors.mainColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: MySize.size10),
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySize.size10),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: ExpansionTile(
                iconColor: ThemeColors.grey1,
                collapsedIconColor: ThemeColors.grey1,
                tilePadding: EdgeInsets.zero,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: Text(
                  "How can I subscribe this plan?",
                  style: TextStyle(
                    color: ThemeColors.black1,
                    fontSize: MySize.size14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
