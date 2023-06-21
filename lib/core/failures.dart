// import '../../common/enums/payment_status.dart';
// import '../../common/enums/status_code_type.dart';
//
// abstract class Failure {
//   final String message;
//   final StatusCode statusCode;
//   final PaymentStatus? paymentStatus;
//   final double? distance;
//
//   const Failure(this.message, this.statusCode, {this.paymentStatus, this.distance});
// }
//
// // General failures
// class ServerFailure extends Failure {
//   const ServerFailure({String? message, StatusCode statusCode = StatusCode.serverError})
//       : super(message ?? "ServerFailure", statusCode);
// }
//
// class OperationFailedFailure extends Failure {
//   const OperationFailedFailure({String? message, StatusCode statusCode = StatusCode.operationFailed})
//       : super(message ?? "OperationFailedFailure", statusCode);
// }
//
// class DioFailure extends Failure {
//   const DioFailure({
//     String? message,
//     StatusCode statusCode = StatusCode.operationFailed,
//     PaymentStatus? paymentStatus,
//     double? distance,
//   }) : super(message ?? "DioFailure", statusCode, paymentStatus: paymentStatus, distance: distance);
//
//   @override
//   String toString() {
//     return 'DioFailure{message: $message, statusCode:$statusCode}';
//   }
// }
