import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hulk/core/utils/assets_data.dart';
import 'package:hulk/core/utils/colors.dart';
import 'package:hulk/core/utils/size_config.dart';
import 'package:hulk/core/utils/styles.dart';
import 'package:hulk/core/widgets/empty_wid.dart';
import 'package:hulk/core/widgets/faliure_wid.dart';
import 'package:hulk/core/widgets/header_wid.dart';
import 'package:hulk/features/home/data/repo/home_repo_imp.dart';
import 'package:hulk/features/home/presentation/views/manager/home%20cubit/home_cubit.dart';
import 'package:hulk/features/home/presentation/views/manager/home%20cubit/home_state.dart';
import 'package:hulk/features/home/presentation/views/widgets/product_item.dart';

class ProductPageBody extends StatefulWidget {
  const ProductPageBody({super.key, required this.searchName});
  final String searchName;

  @override
  State<ProductPageBody> createState() => _ProductPageBodyState();
}

class _ProductPageBodyState extends State<ProductPageBody> {
  List<String> title = [
    'Supporter',
    'UnSupporter',
    'All products',
  ];
  int currentTitle = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocProvider(
            create: (context) =>
                HomeCubit(HomeRepImp())..getProduct(name: widget.searchName),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is GetProductSucc) {
                  if (state.model.data!.isEmpty) {
                    return Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            children: [
                              const Header(height: 300),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    Text(
                                      title[currentTitle],
                                      style: StylesData.font20,
                                    ),
                                    PopupMenuButton(
                                      color: Colors.white,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                            onTap: () {
                                              HomeCubit.get(context)
                                                  .filtterData(
                                                x: 0,
                                              )
                                                  .then((value) {
                                                setState(() {
                                                  currentTitle = 0;
                                                });
                                              });
                                            },
                                            child: const Row(
                                              children: [
                                                Text(
                                                  "Supporter",
                                                  style: TextStyle(
                                                      color: Color(0xFF007900)),
                                                )
                                              ],
                                            )),
                                        PopupMenuItem(
                                          onTap: () {
                                            HomeCubit.get(context)
                                                .filtterData(
                                              x: 1,
                                            )
                                                .then((value) {
                                              setState(() {
                                                currentTitle = 1;
                                              });
                                            });
                                          },
                                          child: const Row(
                                            children: [
                                              Text(
                                                "UnSupporter",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          onTap: () {
                                            HomeCubit.get(context)
                                                .filtterData(
                                              x: 2,
                                            )
                                                .then((value) {
                                              setState(() {
                                                currentTitle = 2;
                                              });
                                            });
                                          },
                                          child: const Row(
                                            children: [
                                              Text(
                                                "All Product",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                      child: Text(
                                        "Filter",
                                        style:
                                            StylesData.fontPoppins14.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                          child: Image(
                            image: AssetImage(AssetsData.footer),
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Positioned(
                            top: 50,
                            left: 10,
                            bottom: 10,
                            right: 10,
                            child: EmptyWidget()),
                      ],
                    );
                  }
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Stack(
                          children: [
                            const Header(height: 300),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  Text(
                                    title[currentTitle],
                                    style: StylesData.font20,
                                  ),
                                  PopupMenuButton(
                                    padding: EdgeInsets.zero,
                                    color: Colors.white,
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                          onTap: () {
                                            print(
                                                "/////////////////////// Supported /////////////////////");
                                            HomeCubit.get(context)
                                                .filtterData(
                                              x: 0,
                                            )
                                                .then((value) {
                                              setState(() {
                                                currentTitle = 0;
                                              });
                                            });
                                          },
                                          child: const Row(
                                            children: [
                                              Text(
                                                "Supporter",
                                                style: TextStyle(
                                                    color: Color(0xFF007900)),
                                              )
                                            ],
                                          )),
                                      PopupMenuItem(
                                        onTap: () {
                                          HomeCubit.get(context)
                                              .filtterData(
                                            x: 1,
                                          )
                                              .then((value) {
                                            setState(() {
                                              currentTitle = 1;
                                            });
                                          });
                                        },
                                        child: const Row(
                                          children: [
                                            Text(
                                              "UnSupporter",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        onTap: () {
                                          HomeCubit.get(context)
                                              .filtterData(
                                            x: 2,
                                          )
                                              .then((value) {
                                            setState(() {
                                              currentTitle = 2;
                                            });
                                          });
                                        },
                                        child: const Row(
                                          children: [
                                            Text(
                                              "All Product",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                    child: Text(
                                      "Filter",
                                      style: StylesData.fontPoppins14.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
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
                        child: Image(
                          image: AssetImage(AssetsData.footer),
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 10,
                        bottom: 10,
                        right: 10,
                        child: GridView.count(
                          primary: true,
                          crossAxisCount: SizeConfig.defaultSize! >= 14 ? 3 : 2,
                          crossAxisSpacing: 2.2,
                          physics: const BouncingScrollPhysics(),
                          mainAxisSpacing: 10.0,
                          childAspectRatio:
                              SizeConfig.defaultSize! >= 14 ? 1.5 : 1,
                          children: List.generate(
                              state.model.data!.length,
                              (index) => productItem(
                                  model: state.model.data![index],
                                  context: context)),
                        ),
                      ),
                    ],
                  );
                } else if (state is GetProductFailure) {
                  return const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Center(
                      child: FailureWidget(),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: kMainColor,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
