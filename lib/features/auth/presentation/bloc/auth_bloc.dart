import 'package:aladia/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:aladia/core/entity/user.dart';
import 'package:aladia/core/usecase/usecase.dart';
import 'package:aladia/features/auth/domian/usecases/current_user.dart';
import 'package:aladia/features/auth/domian/usecases/user_login_usecase.dart';
import 'package:aladia/features/auth/domian/usecases/user_sign_up.dart';
import 'package:aladia/features/auth/presentation/bloc/auth_event.dart';
import 'package:aladia/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentuser;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogIn,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
  })  : _userSignUp = userSignUp,
        _userLogin = userLogIn,
        _currentuser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);

    on<AuthSignUp>((event, emit) async {
      final result = await _userSignUp(
        UserSignUpParams(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          password: event.password,
        ),
      );
      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (user) => _emitAuthSuccess(user as String, emit),
      );
    });

    on<LogIn>((event, emit) async {
      final result = await _userLogin(
        UserLoginParams(
          email: event.email,
          password: event.password,
        ),
      );
      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (user) => _emitAuthSuccess(user, emit),
      );
    });
  }

  void _isUserLoggedIn(
    AuthIsUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _currentuser(NoParams());
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user as String, emit),
    );
  }

  void _emitAuthSuccess(String user, Emitter<AuthState> emit) {
    // _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
