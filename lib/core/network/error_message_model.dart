

import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int result;
  final String errorMessage;


  const ErrorMessageModel({
    required this.result,
    required this.errorMessage,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      result: json["result"],
      errorMessage: json["errorMessage"],
    );
  }

  @override
  List<Object?> get props => [
    result,
    errorMessage,

      ];
}
