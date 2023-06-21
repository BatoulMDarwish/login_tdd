


import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../../auth/data/data_sources/auth_datasource.dart';
import '../../auth/data/repositories/auth_repository.dart';
import '../../auth/domain/repositories/base_repository.dart';
import '../../auth/domain/use_cases/login_usecase.dart';
import '../../auth/presentation/manager/auth_bloc.dart';


final sl = GetIt.instance;
@injectable
class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => AuthBloc(sl()));

    /// Use Cases
    sl.registerLazySingleton(() =>LoginUseCase(sl()));
    /// Repository
    sl.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource());
  }
}
