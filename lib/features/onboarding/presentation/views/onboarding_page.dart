import 'package:flutter/material.dart';
import 'package:hulk/features/onboarding/presentation/views/widgets/boarding_view_body.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BoardingViewBody(),
    );
  }
}
