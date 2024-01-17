import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hulk/core/blocobserve.dart';
import 'package:hulk/core/local/cache_Helper.dart';
import 'package:hulk/core/remote/dio_helper.dart';
import 'package:hulk/core/utils/colors.dart';
import 'package:hulk/core/utils/size_config.dart';
import 'package:hulk/features/splash/presentation/views/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      title: 'Hullk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kMainColor),
        useMaterial3: true,
      ),
      home: const SplahView(),
    );
  }
}
