import 'package:dartz/dartz.dart';
import 'package:hulk/core/errors/failures.dart';
import 'package:hulk/features/home/data/Model/product_model/product_model.dart';

abstract class HomeRep {
  Future<Either<Failure, ProductModel>> productList({required String name});
}
