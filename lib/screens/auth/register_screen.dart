import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/signup/signup_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String routeName = '/registration';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const RegisterScreen(),
    );
  }

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterScreen> {
  // late final TextEditingController _email;
  // late final TextEditingController _password;

  // @override
  // void initState() {
  //   _email = TextEditingController();
  //   _password = TextEditingController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _email.dispose();
  //   _password.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // return BlocListener<AuthBloc, AuthState>(
    //   listener: (context, state) async {
    //     if (state is AuthStateRegistering) {
    //       if (state.exception is WeakPasswordAuthException) {
    //         await showErrorDialog(
    //           context,
    //           context.loc.register_error_weak_password,
    //         );
    //       } else if (state.exception is EmailAlreadyInUseAuthException) {
    //         await showErrorDialog(
    //           context,
    //           context.loc.register_error_email_already_in_use,
    //         );
    //       } else if (state.exception is InvalidEmailAuthException) {
    //         await showErrorDialog(
    //           context,
    //           context.loc.register_error_generic,
    //         );
    //       } else if (state.exception is GenericAuthException) {
    //         await showErrorDialog(
    //           context,
    //           context.loc.register_error_invalid_email,
    //         );
    //       }
    //     }
    //   },
    //   child:
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      "Enter your email and password to do your shopping!"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    //controller: _email,
                    onChanged: (value) {
                      context.read<SignupCubit>().emailChanged(value);
                      // print(state.email);
                    },
                    enableSuggestions: false,
                    autofocus: true,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email here',
                    ),
                  ),
                  TextField(
                    //controller: _password,
                    onChanged: (value) {
                      context.read<SignupCubit>().passwordChanged(value);
                      //print(state.password);
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
                            // await FirebaseAuth.instance
                            //     .createUserWithEmailAndPassword(
                            //   email: email,
                            //   password: password,
                            // );

                            context.read<SignupCubit>().signupWithCredentials();
                            print('sign up clicked');
                          },
                          child: const Text('Register'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                            // context.read<AuthBloc>().add(
                            //       const AuthEventLogOut(),
                            //     );
                          },
                          child: const Text("Already registered? Login here!"),
                        )
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
    //  );
  }
}
