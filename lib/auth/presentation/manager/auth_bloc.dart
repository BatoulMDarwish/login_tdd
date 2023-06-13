import 'dart:async';
import 'package:alpha_tdd/auth/domain/use_cases/login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  AuthBloc(this.loginUseCase) : super(AuthState()) {
    on<LoginEvent>(_login);
  }

  FutureOr<void> _login(LoginEvent event ,Emitter<AuthState> emit) async{
   emit(LoadingLoginState());
    print('mmmmmmmm');
    final result = await loginUseCase(event.numberPhone,event.dailCode);
    result.fold(
          (l) => emit(ErrorLoginState(message:l.message )
      ),
          (r) => emit(
        LoginSuccessState()
      ),
    );
    print('result=$result');
  }
}
