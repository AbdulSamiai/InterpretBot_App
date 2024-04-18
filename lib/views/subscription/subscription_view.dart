import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/mySize.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/views/subscription/subscription_viewmodel.dart';
import 'package:interpretbot/widgets/custom_buttons.dart';
import 'package:interpretbot/widgets/scrollable_column.dart';

class SubscriptionView extends StatelessWidget {
  SubscriptionView({super.key});

  final SubscriptionViewModel viewModel = Get.put(SubscriptionViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subscription"),
      ),
      body: SafeArea(
        child: ScrollableColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MySize.size30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: Text(
                "Subscribe any Membership",
                style: TextStyle(
                  color: ThemeColors.black1,
                  fontSize: MySize.size14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: MySize.size20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: viewModel.checkbox1.value,
                      onChanged: (value) {
                        viewModel.checkbox1.value = value!;
                      },
                      activeColor: ThemeColors.mainColor,
                    ),
                  ),
                  Text(
                    "Proin laoreet felis interdum",
                    style: TextStyle(
                      color: ThemeColors.black1,
                      fontSize: MySize.size12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MySize.size20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: viewModel.checkbox2.value,
                      onChanged: (value) {
                        viewModel.checkbox2.value = value!;
                      },
                      activeColor: ThemeColors.mainColor,
                    ),
                  ),
                  Text(
                    "Proin laoreet felis interdum",
                    style: TextStyle(
                      color: ThemeColors.black1,
                      fontSize: MySize.size12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MySize.size20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: viewModel.checkbox3.value,
                      onChanged: (value) {
                        viewModel.checkbox3.value = value!;
                      },
                      activeColor: ThemeColors.mainColor,
                    ),
                  ),
                  Text(
                    "Proin laoreet felis interdum",
                    style: TextStyle(
                      color: ThemeColors.black1,
                      fontSize: MySize.size12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MySize.size20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: viewModel.checkbox4.value,
                      onChanged: (value) {
                        viewModel.checkbox4.value = value!;
                      },
                      activeColor: ThemeColors.mainColor,
                    ),
                  ),
                  Text(
                    "Proin laoreet felis interdum",
                    style: TextStyle(
                      color: ThemeColors.black1,
                      fontSize: MySize.size12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: Row(
                children: [
                  Text(
                    "Billing Type: ",
                    style: TextStyle(
                      color: ThemeColors.black1,
                      fontSize: MySize.size12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Monthly",
                    style: TextStyle(
                      color: ThemeColors.black1,
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Obx(
                    () => CupertinoSwitch(
                      value: viewModel.switchButton.value,
                      onChanged: (value) {
                        viewModel.switchButton.value = value;
                      },
                      activeColor: ThemeColors.mainColor,
                    ),
                  ),
                  Text(
                    "Annual",
                    style: TextStyle(
                      color: ThemeColors.black1,
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MySize.size20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: InkWell(
                onTap: () {
                  
                },
                child: Container(
                  height: MySize.size120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ThemeColors.fillColor,
                    border: Border.all(
                      color: ThemeColors.mainColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(MySize.size10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Basic",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Free",
                        style: TextStyle(
                          color: ThemeColors.mainColor,
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "• Maximum translation call time of 1 hour",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "• Text translation of 1000 characters.",
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MySize.size20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: Container(
                height: MySize.size150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ThemeColors.fillColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.fromLTRB(
                    MySize.size10, MySize.size10, 0, MySize.size10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Standard",
                          style: TextStyle(
                            color: ThemeColors.black1,
                            fontSize: MySize.size14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          height: MySize.size20,
                          width: MySize.size100,
                          decoration: const BoxDecoration(
                            color: ThemeColors.mainColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Best Seller",
                            style: TextStyle(
                              fontSize: MySize.size12,
                              fontWeight: FontWeight.w500,
                              color: ThemeColors.bgColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "\$ 20 AUD per month,",
                      style: TextStyle(
                        color: ThemeColors.mainColor,
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "\$ 200.00 AUD per year",
                      style: TextStyle(
                        color: ThemeColors.mainColor,
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "• Maximum translation call time of 10 hour",
                      style: TextStyle(
                        color: ThemeColors.black1,
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "• Text translation of 10,000 characters.",
                      style: TextStyle(
                        color: ThemeColors.black1,
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MySize.size20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: Container(
                height: MySize.size150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ThemeColors.fillColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.fromLTRB(
                    MySize.size10, MySize.size10, 0, MySize.size10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Premium",
                      style: TextStyle(
                        color: ThemeColors.black1,
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "\$ 30 AUD per month,",
                      style: TextStyle(
                        color: ThemeColors.mainColor,
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "\$ 300.00 AUD per year",
                      style: TextStyle(
                        color: ThemeColors.mainColor,
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "• Maximum translation call time of 20 hour",
                      style: TextStyle(
                        color: ThemeColors.black1,
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "• Text translation of 20,000 characters.",
                      style: TextStyle(
                        color: ThemeColors.black1,
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MySize.size30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: CustomButton8(
                text: "Subscribe Now",
                radius: 10,
                backgroundColor: ThemeColors.mainColor,
                textColor: ThemeColors.bgColor,
                onPressed: () {},
              ),
            ),
            SizedBox(height: MySize.size50),
          ],
        ),
      ),
    );
  }
}
