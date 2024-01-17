import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hulk/features/home/data/Model/product_model/product_model.dart';
import 'package:hulk/features/home/data/repo/home_repo.dart';
import 'package:hulk/features/home/presentation/views/manager/home%20cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  final HomeRep homeRepo;
  ProductModel l = ProductModel();
  ProductModel suppList = ProductModel();
  ProductModel unSuppList = ProductModel();

  Future<void> getProduct({String? name}) async {
    emit(GetProductLoading());

    var result = await homeRepo.productList(name: name!);

    result.fold((faliure) {
      print(faliure.msq);
      emit(GetProductFailure(errorMessage: faliure.msq));
    }, (list) {
      emit(GetProductSucc(model: list));
      l = list;

      print(l.sucsses);
      if (list.data != null) {
        getFillterData();
      }
    });
  }

  void getFillterData() {
    suppList.data = [];
    unSuppList.data = [];

    for (int i = 0; i <= l.data!.length - 1; i++) {
      if (l.data![i].datumClass!.title.toString() == 'yahia') {
        suppList.data?.add(l.data![i]);
      } else {
        unSuppList.data?.add(l.data![i]);
      }
    }
    print("///////////////////////////////////// lenth ////////");
    print(suppList.data?.length);
    print(unSuppList.data?.length);
  }

  Future<void> filtterData({
    required int x,
  }) async {
    emit(GetProductLoading());

    if (x == 0) {
      emit(GetProductSucc(model: suppList));
    } else if (x == 1) {
      emit(GetProductSucc(model: unSuppList));
    } else {
      emit(GetProductSucc(model: l));
    }
  }
}
