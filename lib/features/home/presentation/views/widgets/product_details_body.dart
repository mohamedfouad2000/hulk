import 'package:flutter/material.dart';
import 'package:hulk/core/widgets/footer_wid.dart';
import 'package:hulk/core/widgets/header_wid.dart';
import 'package:hulk/features/home/data/Model/product_model/datum.dart';
import 'package:hulk/features/home/presentation/views/widgets/product_details_item.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    super.key,
    required this.model,
  });
  final Datum model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    const Header(height: 300),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_sharp,
                              size: 20,
                              color: Color(0xFF292D32),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Footer(),
              ),
              Align(
                alignment: Alignment.center,
                child: ProductDetailsItem(model: model),
              ),
            ],
          ),
        ),
        // const Align(alignment: Alignment.bottomCenter, child: Footer()),
      ],
    );
  }
}
