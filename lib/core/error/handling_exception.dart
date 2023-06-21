import 'dart:async';
import 'dart:convert';
import 'package:alpha_tdd/core/error/exceptions.dart';
import 'package:alpha_tdd/core/error/failure.dart';
import 'package:alpha_tdd/core/error/status_code_type.dart';
import 'package:alpha_tdd/core/network/error_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';



typedef RequestCall<T> = Future<T> Function();

abstract class HandlingExceptionRequest {
  void prettyPrinterError(final String message) {
    Logger(printer: PrettyPrinter(methodCount: 0)).e(message);
  }

  void prettyPrinterWtf(final String message) {
    Logger(printer: PrettyPrinter(methodCount: 0)).wtf(message);
  }

  void prettyPrinterI(final String message) {
    Logger(printer: PrettyPrinter(methodCount: 0)).i(message);
  }

  void prettyPrinterV(final String message) {
    Logger(printer: PrettyPrinter(methodCount: 0)).v(message);
  }

  Exception getException({required int statusCode, String? message}) {

      return ServerException(message: message);

  }

  Future<Either<Failure, T>> handlingExceptionRequest<T>({required RequestCall<T> tryCall}) async {
    try {
      T response = await tryCall();
      return Right(response);
    } on ServerException catch (e, stackTrace) {
    //  await FirebaseCrashlytics.instance.recordError(e, stackTrace, reason: "catch Error.", fatal: true);
      prettyPrinterError("***|| ServerException ||*** ");
      return const Left(ServerFailure());
    } on DioException catch (err, s) {
      // if (err.type == DioErrorType.response) {
      //   // await FirebaseCrashlytics.instance.recordError(
      //   //   err,
      //   //   s,
      //   //   reason: "DioError ${err.response?.statusCode}",
      //   //   information: [
      //   //     "Data: ${err.requestOptions.data} ",
      //   //     "path: ${err.requestOptions.path} ",
      //   //     "baseUrl: ${err.requestOptions.baseUrl} ",
      //   //     "queryParameters: ${err.requestOptions.queryParameters} ",
      //   //     "headers: ${err.requestOptions.headers} ",
      //   //   ],
      //   //   fatal: true,
      //   // );
      // }
      final data = err.response?.data;
      ErrorModel? errorModel;
      String? errorMessage;
      if (data != null && data != "") {
        if (data is Map<String, dynamic>) {
          errorModel = ErrorModel.fromJson(data);
        } else {
          errorModel = ErrorModel.fromJson(jsonDecode(data));
        }
      } else {
        errorMessage = err.message;
      }

      prettyPrinterError("***|| DioError ||*** \n $s");

      return Left(DioFailure(
          message: errorModel?.errorMessage ?? errorMessage,

          statusCode: StatusCode.values.firstWhere((element) => element.code == err.response?.statusCode,
              orElse: () => StatusCode.serverError)));
    } catch (e, stackTrace) {
      //await FirebaseCrashlytics.instance.recordError(e, stackTrace, reason: "catch Error.", fatal: true);

      prettyPrinterError(
        "***|| CATCH ERROR ||***"
        "\n $e"
        "***|| Stack Trace ||***"
        "\n $stackTrace",
      );
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
