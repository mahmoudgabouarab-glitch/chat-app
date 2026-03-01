import 'package:chat_app/core/utils/extension.dart';
import 'package:chat_app/features/auth/view/signup_view.dart';
import 'package:flutter/material.dart';

class LoginTextBtnSignup extends StatelessWidget {
  const LoginTextBtnSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?"),
        TextButton(
          onPressed: () => context.push(SignupView()),
          child: Text("Sign Up"),
        ),
      ],
    );
  }
}
