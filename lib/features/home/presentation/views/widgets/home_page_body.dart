import 'package:flutter/material.dart';
import 'package:hulk/core/utils/size_config.dart';
import 'package:hulk/core/widgets/footer_wid.dart';
import 'package:hulk/core/widgets/header_wid.dart';
import 'package:hulk/features/home/presentation/views/widgets/search_data.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: SizeConfig.screenHeight,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight!,
              width: double.infinity,
              child: const Align(
                alignment: Alignment.topCenter,
                child: Header(
                  height: 300,
                ),
              ),
            ),
            const Align(alignment: Alignment.bottomCenter, child: Footer()),
            const SearchWidget(),
          ],
        ),
      ),
    );
  }
}
