import 'package:cosmetics_app/views/pages/home/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';
import 'model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  void getData() async {
    emit(HomeLoadingState());
    final resp = await DioHelper.getData("/api/Products");
    if (resp.isSuccess) {
      final details = ProductData.fromJson({"data": resp.data});
      emit(HomeSuccessState(list: details.list));
    } else {
      emit(HomeFailedState());
    }
  }
}
