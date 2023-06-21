import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'handling_exception.dart';

abstract class BaseApi<T> with HandlingExceptionRequest {
  BaseApi() {
    Map<String, dynamic> headers = client.options.headers;

    // if (_prefsRepository.token != null) {
    //   headers = client.options.headers..[HttpHeaders.authorizationHeader] = 'Bearer ${_prefsRepository.token}';
    //   // headers = client.options.headers..[HttpHeaders.authorizationHeader] = 'Bearer your_access_token';
    // }

    //headers = client.options.headers..[HttpHeaders.acceptLanguageHeader] = LanguageService.languageCode;

    options = Options(headers: headers);
  }

  @protected
  final client = GetIt.I<Dio>();

  //final _prefsRepository = GetIt.I<PrefsRepository>();

  late Options options;

  Future<T> call();
}
