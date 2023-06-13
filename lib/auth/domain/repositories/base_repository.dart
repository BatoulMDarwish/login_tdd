import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, Unit>> login(String numberPhone,String dailCode);
}