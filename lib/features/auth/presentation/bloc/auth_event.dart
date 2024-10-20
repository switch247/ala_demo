class AuthEvent {}

class AuthSignUp extends AuthEvent {
  final String email;
  final String firstName;
  final String lastName;
  final String password;

  AuthSignUp({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
  });
}

class LogIn extends AuthEvent {
  final String email;
  final String password;

  LogIn({
    required this.email,
    required this.password,
  });
}

class AuthIsUserLoggedIn extends AuthEvent {}
