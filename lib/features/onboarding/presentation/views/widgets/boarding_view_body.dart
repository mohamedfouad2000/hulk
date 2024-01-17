import 'package:flutter/material.dart';
import 'package:hulk/core/local/cache_Helper.dart';
import 'package:hulk/core/utils/assets_data.dart';
import 'package:hulk/core/utils/colors.dart';
import 'package:hulk/core/utils/components.dart';

import 'package:hulk/core/utils/size_config.dart';
import 'package:hulk/core/utils/styles.dart';
import 'package:hulk/features/home/presentation/views/home_page.dart';
import 'package:hulk/features/onboarding/presentation/views/widgets/page_view_iteam.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingViewBody extends StatefulWidget {
  const BoardingViewBody({super.key});

  @override
  State<BoardingViewBody> createState() => _BoardingViewBodyState();
}

class _BoardingViewBodyState extends State<BoardingViewBody> {
  PageController pageController = PageController();
  int? index = 0;
  bool islast = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (value) {
              index = value;
              if (value == 2) {
                setState(() {
                  islast = true;
                });
              } else {
                setState(() {
                  islast = false;
                });
              }
            },
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
          Positioned(
            bottom: SizeConfig.defaultSize! * 25,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: SlideEffect(
                dotHeight: 10,
                dotWidth: 10,
                paintStyle: PaintingStyle.stroke,
                dotColor: kMainColor,
                activeDotColor: kMainColor,
              ),
            ),
          ),
          Positioned(
            bottom: SizeConfig.defaultSize! * 15,
            left: 0,
            right: 0,
            child: Text(
              "Nåsk latyre, ding kakysam amuling vipresade.",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: StylesData.font24,
            ),
          ),
          !islast
              ? Row(
                  children: [
                    defaultButton(
                      c: Colors.white,
                      h: 69,
                      w: 110,
                      fun: () {
                        CacheHelper.setBoolean(key: 'onBoarding', value: true)
                            .then((value) {
                          Nav(context, const HomePage());
                        });
                      },
                      textWidget: Center(
                        child: Text(
                          "Skip",
                          style: StylesData.font18.copyWith(color: kMainColor),
                        ),
                      ),
                    ),
                    const Spacer(),
                    defaultButton(
                      c: kMainColor,
                      h: 69,
                      w: 110,
                      fun: () {
                        pageController.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                      textWidget: Center(
                        child: Text(
                          "Next",
                          style: StylesData.font18,
                        ),
                      ),
                    ),
                  ],
                )
              : defaultButton(
                  c: kMainColor,
                  h: 69,
                  w: 232,
                  fun: () {
                    CacheHelper.setBoolean(key: 'onBoarding', value: true)
                        .then((value) {
                      Nav(context, const HomePage());
                    });
                  },
                  textWidget: Center(
                    child: Text(
                      "Start",
                      style: StylesData.font18,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
