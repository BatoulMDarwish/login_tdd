import 'package:equatable/equatable.dart';

class LoginModel extends Equatable{
  final String activationCode;

  const LoginModel({required this.activationCode});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    activationCode: json['activationCode']
  );

  @override

  List<Object?> get props => [activationCode];
}