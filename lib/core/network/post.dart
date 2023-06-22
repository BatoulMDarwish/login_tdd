import 'dart:async';

import 'package:alpha_tdd/core/error/base_api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../error/status_code_type.dart';



class DioHelper<T> extends BaseApi<T>{
  final String numberPhone;
 DioHelper({required this.numberPhone});
  static late Dio dio;
  static late Response response;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://52.91.25.191:85/api/',
      ),
    );
  }



  static Future<Response> postData({
    required String url,
    Map<String , dynamic>? query,
    required Map<String , dynamic>? data,
    String  lang = 'en' ,
    String ? token ,
  })async{

    dio.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : lang,
      // ignore: prefer_if_null_operators
      'Authorization' : token??'',
    };
    return await dio.post(
        url ,
        queryParameters: query??null,
        data: data
    );
  }

  @override
  Future<T> call() async {
    try {
      final response=await DioHelper.postData(url: 'Account/LogIn?dialCode=%2B963&phoneNumber=$numberPhone', data: {});


      if (response.statusCode == StatusCode.operationSucceeded.code) {
        print('200');
        print('success');
        return Future.value(unit as FutureOr<T>?);


      } else {
        throw getException(statusCode: response.statusCode!, message: response.data['message']);
      }
    } catch (exception) {
      rethrow;
    }
  }



}