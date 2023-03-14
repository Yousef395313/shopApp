import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/Login/cubit/states.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../../shared/network/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  ShopLoginCubit() :super(ShopLoginInitialStateCubit());

  static ShopLoginCubit get(context)=>BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password
})
  {
    emit(ShopLoginLoadingStateCubit());
    dioHelper.postData(
        url: login,
        data: {
          'email' : email,
          'password': password,
        },
    ).then((value) {
      emit(ShopLoginSuccessStateCubit());
      print(value.data);
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopLoginErrorStateCubit(error.toString()));
    });
  }
}