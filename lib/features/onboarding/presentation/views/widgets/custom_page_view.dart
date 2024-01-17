import 'package:flutter/material.dart';
import 'package:hulk/core/utils/assets_data.dart';

import 'package:hulk/features/onboarding/presentation/views/widgets/page_view_iteam.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pageviewcontroller});
  final PageController pageviewcontroller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: SizeConfig.screenHeight! * .6,
      child: PageView(
        controller: pageviewcontroller,
        physics: const BouncingScrollPhysics(),
        children: [
          pageViewItem(
            image: AssetsData.onboarding1,
          ),
          pageViewItem(
            image: AssetsData.onboarding2,
          ),
          pageViewItem(
            image: AssetsData.onboarding3,
          ),
        ],
      ),
    );
  }
}
