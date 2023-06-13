part of 'auth_bloc.dart';
class AuthState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class LoadingLoginState extends AuthState{}

class LoginSuccessState extends AuthState{}

class ErrorLoginState extends AuthState{
  final String message;

  ErrorLoginState({required this.message});

  @override
  List<Object> get props => [message];
}
