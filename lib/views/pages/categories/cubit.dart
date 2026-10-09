import 'package:cosmetics_app/views/pages/categories/states.dart';
import 'package:cosmetics_app/views/pages/categories/view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';
import 'model.dart';

class CategoriesCubit extends Cubit<CategoriesStates>{
  CategoriesCubit():super(CategoriesInitialState());


  void getData() async {
    emit(CategoriesLoadingState());
    final resp = await DioHelper.getData("/api/Categories");
    if (resp.isSuccess) {
      final details = CategoriesData.fromJson({"data": resp.data});
      emit(CategoriesSuccessState(list: details.list));
    }else{
      emit(CategoriesFailedState());
    }
  }
}