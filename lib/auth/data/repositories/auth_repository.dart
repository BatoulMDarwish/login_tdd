
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/repositories/base_repository.dart';
import '../data_sources/auth_datasource.dart';

class AuthRepository  implements BaseAuthRepository{
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepository(this.baseAuthRemoteDataSource);


  @override
  Future<Either<Failure, Unit>> login(String numberPhone,String dailCode) async{
    final result = await baseAuthRemoteDataSource.login(numberPhone,dailCode);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
  
}