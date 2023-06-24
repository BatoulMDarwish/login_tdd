
import 'package:alpha_tdd/core/error/handling_exception.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/repositories/base_repository.dart';
import '../data_sources/auth_datasource.dart';

class AuthRepository  extends BaseAuthRepository with HandlingExceptionRequest{
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepository(this.baseAuthRemoteDataSource);


  @override
  Future<Either<Failure, Unit>> login(String numberPhone,String dailCode) async{
   // return handlingExceptionRequest(tryCall: ()=>baseAuthRemoteDataSource.login(numberPhone,dailCode));
    try {
    final result = await baseAuthRemoteDataSource.login(numberPhone,dailCode);
      return Right(result);
    } catch (failure) {
      return Left(ServerFailure());
    }
  }
  
}