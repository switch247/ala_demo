import 'package:aladia/core/error/failure.dart';
import 'package:aladia/core/usecase/usecase.dart';
import 'package:aladia/features/auth/domian/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:aladia/core/entity/user.dart';

class CurrentUser implements UseCase<User, NoParams> {
  AuthRepository repository;

  CurrentUser({required this.repository});

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
		return await repository.currentUser();
	}
}
