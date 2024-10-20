import 'package:aladia/core/entity/user.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String user;
  AuthSuccess(this.user);
}

final class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}
