import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hulk/core/utils/components.dart';
import 'package:hulk/core/utils/styles.dart';
import 'package:hulk/features/home/data/Model/product_model/datum.dart';
import 'package:hulk/features/home/presentation/views/screens/product_details_screen.dart';

Widget productItem({
  required Datum model,
  required context,
}) {
  Color modelColor = model.datumClass!.color.toString() == '#17ded0'
      ? const Color(0xFF007900)
      : const Color(0xFFCC1100);
  return GestureDetector(
    onTap: () {
      NavegatorPush(
          context,
          ProductDetails(
            model: model,
          ));
    },
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: CachedNetworkImage(
            height: 150,
            // fit: BoxFit.fitHeight,
            imageUrl: model.imagePath.toString(),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline_sharp),
          ),
        ),
        Positioned(
          bottom: -10,
          child: Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              model.name.toString(),
              style: StylesData.font16.copyWith(
                color: modelColor,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
