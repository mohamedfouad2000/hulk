import 'package:flutter/material.dart';
import 'package:hulk/core/utils/assets_data.dart';
import 'package:hulk/core/utils/styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const Image(
          image: AssetImage(AssetsData.footer),
          height: 300,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Development By",
                style: StylesData.font14,
              ),
              const SizedBox(
                width: 8,
              ),
              const Image(
                image: AssetImage(AssetsData.tqniaLogo),
                height: 18,
                width: 60,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "All Right Reseved",
                style: StylesData.font14,
              ),
            ],
          ),
        )
      ],
    );
  }
}
