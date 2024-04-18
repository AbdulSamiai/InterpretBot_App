import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/constant.dart';
import 'package:interpretbot/helper/mySize.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/views/affiliate_program/affiliate_program_view.dart';
import 'package:interpretbot/views/contact_us/contact_us_view.dart';
import 'package:interpretbot/views/faq/faq_view.dart';
// import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/views/profile/profile_viewmodel.dart';
import 'package:interpretbot/views/subscription/subscription_view.dart';
import 'package:interpretbot/widgets/scrollable_column.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final ProfileViewModel viewModel = Get.put(ProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Account"),
        bottom: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          leadingWidth: 100,
          leading: Container(
            height: 70,
            width: 70,
            margin: const EdgeInsets.only(left: 8, bottom: 5),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              border: Border.all(
                color: ThemeColors.bgColor,
                width: 3,
              ),
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage(imgProfile),
              ),
            ),
          ),
          centerTitle: false,
          title: const Text("John Doe"),
        ),
      ),
      body: SafeArea(
        child: ScrollableColumn(
          children: [
            SizedBox(height: MySize.size50),
            ListTile(
              leading: Container(
                height: 40,
                width: 40,
                color: ThemeColors.green,
              ),
              title: Text(
                "Default Language",
                style: TextStyle(
                  color: ThemeColors.black1,
                  fontSize: MySize.size16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ThemeColors.grey1,
              ),
            ),
            const Divider(indent: 10, endIndent: 10),
            ListTile(
              onTap: () {
                Get.to(() => SubscriptionView());
              },
              leading: Container(
                height: 40,
                width: 40,
                color: ThemeColors.green,
              ),
              title: Text(
                "Subscriptions",
                style: TextStyle(
                  color: ThemeColors.black1,
                  fontSize: MySize.size16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ThemeColors.grey1,
              ),
            ),
            const Divider(indent: 10, endIndent: 10),
            ListTile(
              onTap: () {
                Get.to(() => FaqsView());
              },
              leading: Container(
                height: 40,
                width: 40,
                color: ThemeColors.green,
              ),
              title: Text(
                "FAQs",
                style: TextStyle(
                  color: ThemeColors.black1,
                  fontSize: MySize.size16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ThemeColors.grey1,
              ),
            ),
            const Divider(indent: 10, endIndent: 10),
            ListTile(
              leading: Container(
                height: 40,
                width: 40,
                color: ThemeColors.green,
              ),
              title: Text(
                "Payment Options",
                style: TextStyle(
                  color: ThemeColors.black1,
                  fontSize: MySize.size16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ThemeColors.grey1,
              ),
            ),
            const Divider(indent: 10, endIndent: 10),
            ListTile(
              onTap: () {
                Get.to(() => ContactUsView());
              },
              leading: Container(
                height: 40,
                width: 40,
                color: ThemeColors.green,
              ),
              title: Text(
                "Support",
                style: TextStyle(
                  color: ThemeColors.black1,
                  fontSize: MySize.size16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ThemeColors.grey1,
              ),
            ),
            const Divider(indent: 10, endIndent: 10),
            ListTile(
              onTap: () {
                Get.to(() => AffiliateView());
              },
              leading: Container(
                height: 40,
                width: 40,
                color: ThemeColors.green,
              ),
              title: Text(
                "Affiliate Program",
                style: TextStyle(
                  color: ThemeColors.black1,
                  fontSize: MySize.size16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ThemeColors.grey1,
              ),
            ),
            const Divider(indent: 10, endIndent: 10),
            ListTile(
              leading: Container(
                height: 40,
                width: 40,
                color: ThemeColors.green,
              ),
              title: Text(
                "Archives",
                style: TextStyle(
                  color: ThemeColors.black1,
                  fontSize: MySize.size16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ThemeColors.grey1,
              ),
            ),
            const Divider(indent: 10, endIndent: 10),
            ListTile(
              leading: Container(
                height: 40,
                width: 40,
                color: ThemeColors.green,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  color: ThemeColors.black1,
                  fontSize: MySize.size16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: ThemeColors.grey1,
              ),
            ),
            const Divider(indent: 10, endIndent: 10),
            SizedBox(height: MySize.size60),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Terms & Conditions | Private Policy | Cookies",
                style: TextStyle(
                  color: ThemeColors.black1,
                  fontSize: MySize.size16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: MySize.size30),
          ],
        ),
      ),
    );
  }
}
