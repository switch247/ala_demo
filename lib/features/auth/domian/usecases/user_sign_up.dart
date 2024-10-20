import 'package:aladia/core/error/failure.dart';
import 'package:aladia/core/usecase/usecase.dart';
import 'package:aladia/core/entity/user.dart';
import 'package:aladia/features/auth/domian/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository repository;
  UserSignUp({required this.repository});
  @override
  Future<Either<Failure, User>> call(params) async {
    return await repository.signUpWithEmailPassword(
      email: params.email,
      firstName: params.firstName,
      lastName: params.lastName,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  UserSignUpParams(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.password});
}
