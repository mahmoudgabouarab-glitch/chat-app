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
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => SignupView()));
          },
          child: Text("Sign Up"),
        ),
      ],
    );
  }
}
