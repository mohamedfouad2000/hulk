import 'package:flutter/material.dart';
import 'package:hulk/core/utils/assets_data.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(AssetsData.hullk.toString()),
      height: 100,
      width: 80,
      fit: BoxFit.contain,
    );
  }
}
