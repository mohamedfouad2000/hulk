import 'package:hulk/features/home/data/Model/product_model/product_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetProductLoading extends HomeState {}

final class GetProductSucc extends HomeState {
  final ProductModel model;

  GetProductSucc({required this.model});
}

final class GetProductFailure extends HomeState {
  final String errorMessage;

  GetProductFailure({required this.errorMessage});
}
