import 'package:aladia/core/error/failure.dart';
import 'package:aladia/core/usecase/usecase.dart';
import 'package:aladia/features/auth/domian/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:aladia/core/entity/user.dart';

class UserLogin implements UseCase<String, UserLoginParams> {
  final AuthRepository repository;

  UserLogin({required this.repository});

  @override
  Future<Either<Failure, String>> call(UserLoginParams params) async {
    return await repository.logInWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  const UserLoginParams({
    required this.email,
    required this.password,
  });
}
