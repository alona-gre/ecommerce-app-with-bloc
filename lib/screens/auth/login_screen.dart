import 'package:ecommerce_app/blocs/auth/auth_bloc.dart';
import 'package:ecommerce_app/cubits/login/login_cubit.dart';
import 'package:ecommerce_app/screens/auth/register_screen.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          return BlocProvider.of<AuthBloc>(context).state.status ==
                  AuthStatus.authenticated
              ? const HomeScreen()
              : const LoginScreen();
        });
  }

  // late final TextEditingController _email;
  @override
  Widget build(BuildContext context) {
    // return BlocListener<AuthBloc, AuthState>(
    //   listener: (context, state) async {
    //     if (state is AuthStateLoggedOut) {
    //       if (state.exception is UserNotFoundAuthException) {
    //         await showErrorDialog(
    //             context, context.loc.login_error_cannot_find_user);
    //       } else if (state.exception is WrongPasswordAuthException) {
    //         await showErrorDialog(
    //             context, context.loc.login_error_wrong_credentials);
    //       } else if (state.exception is GenericAuthException) {
    //         await showErrorDialog(context, context.loc.login_error_auth_error);
    //       }
    //     }
    //   },
    //   child:
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) =>
                previous.email != current.email ||
                previous.password != current.password,
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Please log in to your account'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    //controller: _email,
                    onChanged: (email) {
                      context.read<LoginCubit>().emailChanged(email);
                    },
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email here',
                    ),
                  ),
                  TextField(
                    // controller: _password,
                    onChanged: (password) {
                      context.read<LoginCubit>().passwordChanged(password);
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      hintText: 'Enter your password here',
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            // final email = _email.text;
                            // final password = _password.text;
                            // context.read<AuthBloc>().add(
                            //       AuthEventLogIn(
                            //         email,
                            //         password));
                            context.read<LoginCubit>().loginWithCredentials();
                          },
                          child: const Text('Log in'),
                        ),
                        TextButton(
                          onPressed: () {
                            // context.read<AuthBloc>().add(
                            //       const AuthEventForgotPassword(),
                            //     );
                          },
                          child: const Text('I forgot my password'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RegisterScreen.routeName);
                            // context.read<AuthBloc>().add(
                            //       const AuthEventShouldRegister(),
                            //     );
                          },
                          child:
                              const Text('Not registered yet? Register here!'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
    //);
  }
}
