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
      if (list.data != null) {}
    });
  }

  void filtterData({required int id}) async {
    emit(GetProductLoading());
    print(l.data!.length);
    if (id == -1) {
      emit(GetProductSucc(model: l));
    } else {
      ProductModel fillterList = ProductModel();
      fillterList.data = [];
      for (int i = 0; i <= l.data!.length - 1; i++) {
        if (l.data?[i].datumClass?.id == id) {
          fillterList.data!.add(l.data![i]);
        }
      }
      print(fillterList.data?.length);
      emit(GetProductSucc(model: fillterList));
    }
  }
}
