import 'package:flutter/material.dart';
import 'package:hulk/features/home/presentation/views/widgets/search_title.dart';
import 'package:hulk/features/splash/presentation/views/widgets/logo_image.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 150,
        ),
        const LogoImage(),
        const SizedBox(
          height: 80,
        ),
        Expanded(child: SearchTitle()),
      ],
    );
  }
}
