import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocListener<AuthBloc, AuthState>(
    //   listener: (context, state) async {
    //     if (state is AuthStateForgotPassword) {
    //       if (state.hasSentEmail) {
    //         _controller.clear();
    //         await showPasswordResetSentDialog(context);
    //       }
    //       if (state.exception != null) {
    //         await showErrorDialog(
    //             context, context.loc.forgot_password_view_generic_error);
    //       }
    //     }
    //   },
    //   child:
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                  "If you forgot your password, simply enter your email and we will send you a password reset link."),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: 'Enter your password here',
                ),
              ),
              TextButton(
                onPressed: () {
                  final email = _controller.text;
                  // context.read<AuthBloc>().add(
                  //       AuthEventForgotPassword(email: email),
                  //     );
                },
                child: const Text("Send me password reset link"),
              ),
              TextButton(
                onPressed: () {
                  // context.read<AuthBloc>().add(
                  //       const AuthEventLogOut(),
                  //     );
                },
                child: const Text("Back to login page"),
              ),
            ],
          ),
        ),
      ),
    );
//    );
  }
}
