import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulk/core/utils/components.dart';
import 'package:hulk/core/utils/styles.dart';
import 'package:hulk/features/home/data/Model/product_model/datum.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProductDetailsItem extends StatelessWidget {
  const ProductDetailsItem({
    super.key,
    required this.model,
  });
  final Datum model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              height: 200,
              imageUrl: model.imagePath.toString(),
              placeholder: (context, url) =>
                  LoadingAnimationWidget.newtonCradle(
                size: 50,
                color: Colors.grey,
              ),
              errorWidget: (context, url, er) => Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              model.name.toString(),
              textAlign: TextAlign.center,
              style: StylesData.font25,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 6.35,
                  height: 6.35,
                  decoration: ShapeDecoration(
                    color: colorHex(
                        model.datumClass?.color.toString() ?? '#0xf123'),
                    shape: const OvalBorder(),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  model.datumClass!.title.toString(),
                  textAlign: TextAlign.center,
                  style: StylesData.font19.copyWith(
                    color: colorHex(
                        model.datumClass?.color.toString() ?? '#0xf123'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${model.name.toString()} ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'PoppinsBold',
                        fontSize: 12.71,
                        fontWeight: FontWeight.w600,
                        height: 0,
                        letterSpacing: 0.53,
                      ),
                    ),
                    TextSpan(
                      text: model.description.toString(),
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 12.71,
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.53,
                        ),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
