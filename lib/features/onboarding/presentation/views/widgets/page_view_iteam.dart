import 'package:flutter/material.dart';

import 'package:hulk/core/utils/size_config.dart';

Widget pageViewItem({
  required String image,
}) =>
    Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight! * .10,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * .42,
          child: Center(
              child: Image.asset(
            image,
            fit: BoxFit.scaleDown,
          )),
        ),
      ],
    );
