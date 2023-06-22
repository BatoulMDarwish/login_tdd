import 'package:alpha_tdd/core/error/base_api.dart';
import 'package:alpha_tdd/core/network/post.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_constance.dart';
import '../../../../core/network/error_message_model.dart';
import '../../domain/use_cases/login_usecase.dart';

abstract class BaseAuthRemoteDataSource {
  Future<Unit> login(String numberPhone,String dailCode);
}

class AuthRemoteDataSource implements BaseAuthRemoteDataSource  {
  Future<Unit> login(String numberPhone,String dailCode) async {
    final DioHelper<Unit> getItemsRemote = DioHelper<Unit>(

      numberPhone: numberPhone
    );
    return getItemsRemote();
  }

  // @override
  // Future<Unit> login(String numberPhone,String dailCode) async{
  //   final response=await DioHelper.postData(url: 'Account/LogIn?dialCode=%2B963&phoneNumber=$numberPhone', data: {});
  //   if (response.statusCode == 200) {
  //    print('200');
  //    print('success');
  //    return Future.value(unit);
  //   } else {
  //
  //
  //   }
  // }
}