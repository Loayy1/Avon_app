import 'package:cosmetics_app/core/logic/dio_helper.dart';
import 'package:cosmetics_app/views/pages/profile/model.dart';
import 'package:cosmetics_app/views/pages/profile/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customes_widget.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit():super(ProfileInitialStates());

  final list = [
    ProfileModel(title: "Edit Info", img: "assets/icons/edit_info.svg"),
    ProfileModel(
      title: "Order History",
      img: "assets/icons/order_history.svg",
    ),
    ProfileModel(title: "Wallet", img: "assets/icons/wallet.svg"),
    ProfileModel(title: "Settings", img: "assets/icons/settings.svg"),
    ProfileModel(title: "Voucher ", img: "assets/icons/voucher .svg"),
  ];
  
  void getData()async{
    emit(ProfileLoadingStates());
    final resp = await DioHelper.getData("/api/Auth/profile");
    if(resp.isSuccess){
      final details = ProfileInfoData.fromJson({"data":resp.data});
      emit(ProfileSuccessStates(list: details.list));
    }else{
      emit(ProfileFailedStates());
    }
  }
}