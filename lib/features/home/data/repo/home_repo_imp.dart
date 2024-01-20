import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hulk/core/errors/failures.dart';
import 'package:hulk/core/remote/dio_helper.dart';
import 'package:hulk/features/home/data/Model/fillter_model/fillter_model.dart';
import 'package:hulk/features/home/data/Model/product_model/product_model.dart';
import 'package:hulk/features/home/data/repo/home_repo.dart';

class HomeRepImp implements HomeRep {
  @override
  Future<Either<Failure, ProductModel>> productList(
      {required String name}) async {
    ProductModel? list;
    try {
      Response<dynamic> res = await DioHelper.getData(url: "list", data: {
        'name': name.toString(),
      });
      list = ProductModel.fromJson(res.data);
      return right(list);
    } catch (e) {
      if (e is DioException) {
        // ignore: invalid_return_type_for_catch_error
        return left(ServerFailure.fromDioError(e));
      }
      // ignore: invalid_return_type_for_catch_error
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FillterModel>> fillterData() async {
    FillterModel? list;
    try {
      Response<dynamic> res = await DioHelper.getData(url: "classes", data: {});
      list = FillterModel.fromJson(res.data);
      return right(list);
    } catch (e) {
      if (e is DioException) {
        // ignore: invalid_return_type_for_catch_error
        return left(ServerFailure.fromDioError(e));
      }
      // ignore: invalid_return_type_for_catch_error
      return left(ServerFailure(msq: e.toString()));
    }
  }
}
