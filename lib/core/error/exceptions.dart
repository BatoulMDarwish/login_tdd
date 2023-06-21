




import '../network/error_message_model.dart';

class ServerException implements Exception {
  final String? message;

  ServerException({this.message = "ServerException"});
}


// class OfflineException implements Exception{
//   final String message;
//
//   const OfflineException({
//     required this.message,
//   });
// }
