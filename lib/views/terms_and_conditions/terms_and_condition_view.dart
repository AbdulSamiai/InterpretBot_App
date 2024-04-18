import 'package:flutter/material.dart';
import 'package:interpretbot/helper/mySize.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/widgets/scrollable_column.dart';

class TermsAndConditionView extends StatelessWidget {
  const TermsAndConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
      ),
      body: SafeArea(
        child: ScrollableColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MySize.size30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: Text(
                "1. Terms",
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
              child: Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                style: TextStyle(
                  color: ThemeColors.grey1,
                  fontSize: MySize.size14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: MySize.size20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: Text(
                "2. Use License",
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
              child: Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                style: TextStyle(
                  color: ThemeColors.grey1,
                  fontSize: MySize.size14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
