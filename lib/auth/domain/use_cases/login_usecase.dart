
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../repositories/base_repository.dart';


class LoginUseCase {
  final BaseAuthRepository baseAuthRepository;

  LoginUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, Unit>> call(String numberPhone,String dailCode) async {
    return await baseAuthRepository.login(numberPhone,dailCode);
  }
}

