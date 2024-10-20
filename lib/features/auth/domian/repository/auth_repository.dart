import 'package:aladia/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:aladia/core/entity/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> logInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> currentUser();
}
