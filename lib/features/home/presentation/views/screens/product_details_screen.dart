import 'package:flutter/material.dart';
import 'package:hulk/features/home/data/Model/product_model/datum.dart';
import 'package:hulk/features/home/presentation/views/widgets/product_details_body.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.model,
  });
  final Datum model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ProductDetailsBody(
        model: model,
      )),
    );
  }
}
