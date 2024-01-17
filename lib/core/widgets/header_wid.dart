import 'package:flutter/material.dart';
import 'package:hulk/core/utils/assets_data.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage(
        AssetsData.header,
      ),

      height: height,
      width: double.infinity,
      // height: 300,
      fit: BoxFit.fill,
    );
  }
}
