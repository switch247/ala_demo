import 'package:aladia/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:aladia/core/secrets/app_secrets.dart';
import 'package:aladia/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:aladia/features/auth/data/repositories/auth_repositories_imp.dart';
import 'package:aladia/features/auth/domian/repository/auth_repository.dart';
import 'package:aladia/features/auth/domian/usecases/current_user.dart';
import 'package:aladia/features/auth/domian/usecases/user_login_usecase.dart';
import 'package:aladia/features/auth/domian/usecases/user_sign_up.dart';
import 'package:aladia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependecies() async {
  _initAuth();
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoriesImp(
      remoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => UserSignUp(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserLogin(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => CurrentUser(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(() => AppUserCubit());

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogIn: serviceLocator(),
      currentUser: serviceLocator(),
      appUserCubit: serviceLocator(),
    ),
  );
}
