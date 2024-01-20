import 'package:bloc/bloc.dart';
import 'package:hulk/features/home/data/Model/fillter_model/fillter_model.dart';
import 'package:hulk/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'fillter_data_state.dart';

class FillterDataCubit extends Cubit<FillterDataState> {
  FillterDataCubit(this.homeRep) : super(FillterDataInitial());
  final HomeRep homeRep;
  Future<void> getFillterData() async {
    emit(GetFillterDataLoading());
    var res = await homeRep.fillterData();
    res.fold((failure) {
      emit(GetFillterDataFailure(errorMessage: failure.msq));
    }, (fillterdata) {
      print('///////////////////////////////// //////////////////////');
      print(fillterdata.sucsses);
      emit(GetFillterDataSucc(model: fillterdata));
    });
  }
}
