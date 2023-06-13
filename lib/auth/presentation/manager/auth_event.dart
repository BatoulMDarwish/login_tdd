part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEvent extends AuthEvent{
  final String numberPhone;
  final String dailCode;
  LoginEvent(this.numberPhone, this.dailCode);
  @override
  List<Object?> get props => [numberPhone];

}
