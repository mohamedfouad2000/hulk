import 'package:flutter/material.dart';
import 'package:hulk/core/utils/colors.dart';
import 'package:hulk/core/utils/components.dart';
import 'package:hulk/core/utils/styles.dart';
import 'package:hulk/features/home/presentation/views/screens/products_page.dart';

// ignore: must_be_immutable
class SearchTitle extends StatefulWidget {
  const SearchTitle({
    super.key,
  });

  @override
  State<SearchTitle> createState() => _SearchTitleState();
}

class _SearchTitleState extends State<SearchTitle> {
  TextEditingController searchCon = TextEditingController();

  String labelText = 'See all products';

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleText(),
          const SizedBox(
            height: 16,
          ),
          Form(
            key: formkey,
            child: customTextFormedFiled(
                val: "   Enter product Name",
                controller: searchCon,
                onTap: () {},
                preicon: Icons.search,
                hintText: "Search",
                onChanged: (txt) async {
                  if (searchCon.text.toString().trim().isNotEmpty) {
                    setState(() {
                      labelText = 'Search';
                    });
                  } else {
                    setState(() {
                      labelText = 'See all products';
                    });
                  }
                }),
          ),
          const SizedBox(
            height: 16,
          ),
          defaultButton(
              fun: () {
                NavegatorPush(
                    context,
                    ProductPage(
                      searchName: searchCon.text,
                    ));
              },
              textWidget: Text(
                labelText,
                style: StylesData.font16,
              ),
              h: 48,
              w: double.infinity,
              c: kMainColor),
        ],
      ),
    );
  }

  Padding TitleText() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: 'Use the search bar to find out if the product is',
                style: StylesData.fontPoppins14),
            const TextSpan(
              text: ' ',
              style: TextStyle(
                color: Color(0xFF717171),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                height: 0,
              ),
            ),
            const TextSpan(
              text: 'supporter',
              style: TextStyle(
                color: Color(0xFF007900),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            TextSpan(
                text: ' ',
                style: StylesData.fontPoppins14.copyWith(
                  color: const Color(0xFF717171),
                )),
            TextSpan(text: 'or', style: StylesData.fontPoppins14),
            const TextSpan(
              text: ' ',
              style: TextStyle(
                color: Color(0xFF717171),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                height: 0,
              ),
            ),
            TextSpan(
                text: 'not supporter',
                style: StylesData.fontPoppins14.copyWith(
                  color: const Color(0xFFCC1100),
                )),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
