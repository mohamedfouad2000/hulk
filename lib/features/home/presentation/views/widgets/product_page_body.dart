import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hulk/core/utils/assets_data.dart';
import 'package:hulk/core/utils/colors.dart';
import 'package:hulk/core/utils/components.dart';
import 'package:hulk/core/utils/size_config.dart';
import 'package:hulk/core/utils/styles.dart';
import 'package:hulk/core/widgets/empty_wid.dart';
import 'package:hulk/core/widgets/faliure_wid.dart';
import 'package:hulk/features/home/data/repo/home_repo_imp.dart';
import 'package:hulk/features/home/presentation/views/manager/fillterCubit/fillter_data_cubit.dart';
import 'package:hulk/features/home/presentation/views/manager/home%20cubit/home_cubit.dart';
import 'package:hulk/features/home/presentation/views/manager/home%20cubit/home_state.dart';
import 'package:hulk/features/home/presentation/views/widgets/product_item.dart';

class ProductPageBody extends StatefulWidget {
  const ProductPageBody({super.key, required this.searchName, required this.o});
  final String searchName;
  final Orientation o;

  @override
  State<ProductPageBody> createState() => _ProductPageBodyState();
}

class _ProductPageBodyState extends State<ProductPageBody> {
  String title = 'All Products';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FillterDataCubit(HomeRepImp())..getFillterData(),
        ),
        BlocProvider(
          create: (context) =>
              HomeCubit(HomeRepImp())..getProduct(name: widget.searchName),
        ),
      ],
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AssetsData.backGround),
          fit: BoxFit.fill,
        )),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        title,
                        style: StylesData.font20,
                      ),
                      BlocBuilder<FillterDataCubit, FillterDataState>(
                        builder: (context, state) {
                          if (state is GetFillterDataSucc) {
                            return PopupMenuButton(
                              padding: EdgeInsets.zero,
                              color: Colors.white,
                              itemBuilder: (context) =>
                                  ListPopUpMenu(state, context),
                              child: Text(
                                "Filter",
                                style: StylesData.fontPoppins14.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          } else if (state is GetFillterDataFailure) {
                            return Container();
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                if (state is GetProductSucc)
                  Builder(builder: (context) {
                    if (state.model.data!.isNotEmpty) {
                      return Expanded(
                        child: GridView.count(
                          primary: true,
                          crossAxisCount: SizeConfig.defaultSize! >= 14 ? 3 : 2,
                          crossAxisSpacing: 5,
                          physics: const BouncingScrollPhysics(),
                          mainAxisSpacing: 10.0,
                          childAspectRatio:
                              SizeConfig.defaultSize! >= 14 ? 1.5 : 1,
                          children: List.generate(
                            state.model.data!.length,
                            (index) => productItem(
                                model: state.model.data![index],
                                context: context),
                          ),
                        ),
                      );
                    } else {
                      return Expanded(child: emptyList(context));
                    }
                  }),
                if (state is GetProductFailure) Expanded(child: failureList()),
                if (state is GetProductLoading) Expanded(child: LoadingList())
              ],
            );
          },
        ),
      ),
    );
  }

  List<PopupMenuItem<dynamic>> ListPopUpMenu(
      GetFillterDataSucc state, BuildContext context) {
    return List.generate(state.model.data!.length + 1, (index) {
      if (index != state.model.data!.length) {
        return PopupMenuItem(
          onTap: () {
            HomeCubit.get(context)
                .filtterData(id: state.model.data![index].id!);
            setState(() {
              title = state.model.data![index].title!;
            });
          },
          child: Text(
            state.model.data![index].title.toString(),
            style: TextStyle(
              color: colorHex(
                state.model.data![index].color.toString(),
              ),
            ),
          ),
        );
      } else {
        return PopupMenuItem(
          onTap: () {
            HomeCubit.get(context).filtterData(id: -1);
            setState(() {
              title = 'All Products';
            });
          },
          child: const Text(
            "All Products",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        );
      }
    });
  }

  Center LoadingList() {
    return Center(
      child: CircularProgressIndicator(
        color: kMainColor,
      ),
    );
  }

  Padding failureList() {
    return const Padding(
      padding: EdgeInsets.all(18.0),
      child: Center(
        child: FailureWidget(),
      ),
    );
  }

  Widget emptyList(BuildContext context) {
    return const Center(child: EmptyWidget());
  }
}
