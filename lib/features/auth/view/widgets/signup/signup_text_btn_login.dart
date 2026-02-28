import 'package:chat_app/features/auth/view/login_view.dart';
import 'package:flutter/material.dart';

class SignupTextBtnLogin extends StatelessWidget {
  const SignupTextBtnLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginView()),
              (route) => false,
            );
          },
          child: const Text("Login"),
        ),
      ],
    );
  }
}
