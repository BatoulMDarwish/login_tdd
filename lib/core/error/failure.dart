import 'package:alpha_tdd/core/error/status_code_type.dart';
import 'package:equatable/equatable.dart';

abstract class Failure {
  final String message;
  final StatusCode statusCode;
  const Failure(this.message, this.statusCode);

  @override
  List<Object> get props => [message,statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure({String? message, StatusCode statusCode = StatusCode.serverError})
      : super(message ?? "ServerFailure", statusCode);
}

class DioFailure extends Failure {
  const DioFailure({
    String? message,
    StatusCode statusCode = StatusCode.operationFailed,
  }) : super(message ?? "DioFailure", statusCode);

  @override
  String toString() {
    return 'DioFailure{message: $message, statusCode:$statusCode}';
  }
}

// class OfflineFailure extends Failure{
//   const OfflineFailure(super.message);
//
// }
