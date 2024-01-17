import 'package:flutter/material.dart';
import 'package:hulk/core/local/cache_Helper.dart';
import 'package:hulk/core/utils/components.dart';
import 'package:hulk/core/widgets/footer_wid.dart';
import 'package:hulk/core/widgets/header_wid.dart';
import 'package:hulk/features/home/presentation/views/home_page.dart';
import 'package:hulk/features/onboarding/presentation/views/onboarding_page.dart';
import 'package:hulk/features/splash/presentation/views/widgets/logo_image.dart';

class SplahView extends StatefulWidget {
  const SplahView({super.key});

  @override
  State<SplahView> createState() => _SplahViewState();
}

class _SplahViewState extends State<SplahView> {
  bool animate = false;
  bool isBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
  Future fadeInAnimation() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      animate = true;
    });

    await Future.delayed(const Duration(seconds: 8), () {
      if (isBoarding) {
        Nav(context, const HomePage());
      } else {
        Nav(context, const OnBoardingPage());
      }
    });
  }

  @override
  void initState() {
    fadeInAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(height: 300),
          Expanded(
            child: Center(
              child: AnimatedOpacity(
                opacity: animate ? 1 : 0,
                duration: const Duration(seconds: 4),
                child: const LogoImage(),
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
