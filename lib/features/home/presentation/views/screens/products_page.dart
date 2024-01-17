import 'package:flutter/material.dart';
import 'package:hulk/features/home/presentation/views/widgets/product_page_body.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.searchName});
  final String searchName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ProductPageBody(
        searchName: searchName,
      )),
    );
  }
}
