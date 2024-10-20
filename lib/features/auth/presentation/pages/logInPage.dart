import 'package:aladia/core/common/widgets/loader.dart';
import 'package:aladia/core/theme/app_pallet.dart';
import 'package:aladia/core/utils/helper_functions.dart';
import 'package:aladia/core/utils/show_snack_bar.dart';
import 'package:aladia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:aladia/features/auth/presentation/bloc/auth_event.dart';
import 'package:aladia/features/auth/presentation/bloc/auth_state.dart';
import 'package:aladia/features/auth/presentation/pages/loginSuccess.dart';
import 'package:aladia/features/auth/presentation/widgets/auth_field.dart';
import 'package:aladia/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:aladia/features/auth/presentation/widgets/custom_divider.dart';
import 'package:aladia/features/auth/presentation/widgets/social_button.dart';
import 'package:aladia/features/auth/presentation/widgets/welcome_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => LogInPage());

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LogInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use Theme from context
    var isDarkMode = AHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Loader();
          }

          return Container(
            color: isDarkMode ? Colors.black : Colors.white,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      WelcomeContainer(context, isDarkMode),
                      const SizedBox(height: 40),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            AuthField(
                              prefixIcon: Icon(Icons.email),
                              controller: emailController,
                              hintText: 'E-mail',
                              isDarkMode: isDarkMode,
                            ),
                            const SizedBox(height: 16),
                            AuthField(
                              prefixIcon: Icon(Icons.key),
                              controller: passwordController,
                              hintText: 'Password',
                              isObscure: true,
                              isDarkMode: isDarkMode,
                            ),
                            const SizedBox(height: 20),
                            AuthGradientButton(
                              isDarkMode: isDarkMode,
                              buttonText: 'Log In',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                        LogIn(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                        ),
                                      );
                                  print("success | failure  ");
                                  if (state is AuthSuccess) {
                                    print("success:  ");

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LoginSuccessPage(),
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                            const SizedBox(height: 24),
                            CustomDivider(isDarkMode),
                            const SizedBox(height: 24),
                            SocialButton(
                              isDarkMode: isDarkMode,
                              text: 'Sign in with Google',
                              assetName: 'assets/google.png',
                              onPressed: () {
                                // TODO: Implement Google sign in
                              },
                            ),
                            const SizedBox(height: 12),
                            SocialButton(
                              isDarkMode: isDarkMode,
                              text: 'Sign in with Facebook',
                              assetName: 'assets/facebook.png',
                              onPressed: () {
                                // TODO: Implement Facebook sign in
                              },
                            ),
                            const SizedBox(height: 12),
                            SocialButton(
                              isDarkMode: isDarkMode,
                              text: 'Sign in with Apple',
                              assetName: 'assets/apple.png',
                              onPressed: () {
                                // TODO: Implement Apple sign in
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Terms & conditions',
                        style: TextStyle(
                          fontSize: 12,
                          color: isDarkMode ? Colors.white70 : Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
