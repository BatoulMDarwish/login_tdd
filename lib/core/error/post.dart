// import 'dart:async';
// import 'package:alpha_tdd/core/error/base_api.dart';
// import 'package:alpha_tdd/core/error/status_code_type.dart';
// import 'package:dio/dio.dart';
// import '../../api.dart';
// import '../../client_config.dart';
//
// class PostClient<T> extends BaseApi<T> {
//   PostClient({
//     required this.requestPrams,
//     this.onSendProgress,
//     this.onReceiveProgress,
//   })  : _fromJson = requestPrams.response.fromJson,
//         _valueOnSuccess = requestPrams.response.returnValueOnSuccess,
//         _queryParameters = requestPrams.queryParameters,
//         _data = requestPrams.data,
//         _endpoint = requestPrams.endpoint;
//
//  // final RequestConfig<T> requestPrams;
//
//   final ProgressCallback? onSendProgress;
//   final ProgressCallback? onReceiveProgress;
//
//   final FromJson<T>? _fromJson;
//   final T? _valueOnSuccess;
//   final dynamic _queryParameters;
//   final dynamic _data;
//   final String _endpoint;
//
//   @override
//   Future<T> call() async {
//     try {
//       final uri = Uri.parse(client.options.baseUrl);
//
//       final Response response = await client.postUri(
//         Uri(
//           port: uri.port,
//           host: uri.host,
//           scheme: uri.scheme,
//           path: _endpoint,
//           queryParameters: _queryParameters,
//         ),
//         options: options,
//         data: _data,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//
//       if (response.statusCode == StatusCode.operationSucceeded.code) {
//         if (_fromJson == null) {
//           return Future.value(_valueOnSuccess);
//         }
//
//         return _fromJson!(response.data);
//       } else {
//         throw getException(statusCode: response.statusCode!, message: response.data['message']);
//       }
//     } catch (exception) {
//       rethrow;
//     }
//   }
// }
