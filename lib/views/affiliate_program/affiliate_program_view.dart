import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/mySize.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/views/affiliate_program/affiliate_program_viewmodel.dart';
import 'package:interpretbot/widgets/scrollable_column.dart';

class AffiliateView extends StatelessWidget {
  AffiliateView({super.key});

  final AffiliateViewModel viewModel = Get.put(AffiliateViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Affiliate Program"),
      ),
      body: SafeArea(
        child: ScrollableColumn(
          children: [
            SizedBox(height: MySize.size30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: Container(
                height: MySize.size100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ThemeColors.mainColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "10% Commission",
                          style: TextStyle(
                            color: ThemeColors.bgColor,
                            fontSize: MySize.size16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "7 days free plan",
                          style: TextStyle(
                            color: ThemeColors.bgColor,
                            fontSize: MySize.size16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(ThemeColors.bgColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        ),
                      ),
                      child: Text(
                        "Join Now",
                        style: TextStyle(
                          color: ThemeColors.mainColor,
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
