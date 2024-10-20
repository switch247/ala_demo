import 'package:aladia/core/error/exception.dart';
import 'package:aladia/core/error/failure.dart';
import 'package:aladia/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:aladia/core/entity/user.dart';
import 'package:aladia/features/auth/domian/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoriesImp implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoriesImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUserData('temp id');
      if (user != null) {
        return right(user);
      }
      return left(Failure('User not logged in'));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      var token = await remoteDataSource.logInWithEmailPassword(
          email: email, password: password);
      return right(token);
    } catch (e) {
      print(e);
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    return _getUser(() async => remoteDataSource.signUpWithEmailPassword(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password));
  }
}

Future<Either<Failure, User>> _getUser(
  Future<User> Function() fn,
) async {
  try {
    final user = await fn();
    return right(user);
  } on ServerException catch (e) {
    return left(Failure(e.message));
  } on Error catch (e) {
    return left(Failure(e.toString()));
  }
}
