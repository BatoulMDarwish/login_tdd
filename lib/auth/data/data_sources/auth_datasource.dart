import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_constance.dart';
import '../../../../core/network/error_message_model.dart';
import '../../domain/use_cases/login_usecase.dart';

abstract class BaseAuthRemoteDataSource {
  Future<Unit> login(String numberPhone,String dailCode);}

class AuthRemoteDataSource implements BaseAuthRemoteDataSource {

  @override
  Future<Unit> login(String numberPhone,String dailCode) async{
     final response = await Dio(
        BaseOptions(
            receiveDataWhenStatusError: true,
            receiveTimeout: const Duration(seconds: 5),
            connectTimeout: const Duration(seconds: 6),
            headers: {
              'Content-Type':'multipart/form-data',
              'Accept':'text/plain'
            })
    ).post('http://52.91.25.191:85/api/Account/LogIn?dialCode=%2B963&phoneNumber=$numberPhone');

    if (response.statusCode == 200) {
     print('200');
     return Future.value(unit);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}