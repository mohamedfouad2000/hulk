import 'package:flutter/material.dart';
import 'package:hulk/features/home/presentation/views/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: HomePageBody(),
    );
  }
}
