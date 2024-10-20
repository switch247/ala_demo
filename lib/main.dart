import 'package:aladia/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:aladia/core/common/cubits/app_user/app_user_state.dart';
import 'package:aladia/core/theme/theme.dart';
import 'package:aladia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:aladia/features/auth/presentation/bloc/auth_event.dart';
import 'package:aladia/features/auth/presentation/pages/logInPage.dart';
import 'package:aladia/init_dependecies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await initDependecies();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<AppUserCubit>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<AuthBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightThemeMode,
      darkTheme: AppTheme.darkThemeMode,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return const Scaffold();
          }
          return LogInPage();
        },
      ),
    );
  }
}
