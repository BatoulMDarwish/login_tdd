import 'package:dio/dio.dart';



class DioHelper{

  static late Dio dio;
  static late Response response;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://52.91.25.191:85/api/',
      ),
    );
  }

  // static Future<Response> getData({
  //   required String url,
  //   Map<String , dynamic>? query,
  //   String lang ='en',
  //   String?  token
  // })async{
  //
  //   dio.options.headers={
  //     'Content-Type' : 'application/json',
  //     'lang' : lang,
  //     'Authorization' : token ?? '',
  //   };
  //   return await dio.get(
  //     url,
  //     queryParameters: query??null,
  //
  //   );
  // }

  static Future<Response> postData({
    required String url,
    Map<String , dynamic>? query,
    required Map<String , dynamic> data,
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

  // static Future<Response> putData({
  //   required String url,
  //   Map<String , dynamic>? query,
  //   required Map<String , dynamic> data,
  //   String  lang = 'en' ,
  //   String ? token ,
  // })async{
  //
  //   dio.options.headers = {
  //     'Content-Type' : 'application/json',
  //     'lang' : lang,
  //     'Authorization' : token??'',
  //   };
  //   return await dio.put(
  //       url ,
  //       queryParameters: query??null,
  //       data: data
  //   );
  // }


}