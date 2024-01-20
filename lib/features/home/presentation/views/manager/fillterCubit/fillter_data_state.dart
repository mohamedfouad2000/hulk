part of 'fillter_data_cubit.dart';

@immutable
sealed class FillterDataState {}

final class FillterDataInitial extends FillterDataState {}

final class GetFillterDataLoading extends FillterDataState {}

final class GetFillterDataSucc extends FillterDataState {
  final FillterModel model;
  GetFillterDataSucc({required this.model});
}

final class GetFillterDataFailure extends FillterDataState {
  final String errorMessage;

  GetFillterDataFailure({required this.errorMessage});
}
