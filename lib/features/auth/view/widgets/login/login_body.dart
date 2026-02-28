import 'package:chat_app/core/utils/assets.dart';
import 'package:chat_app/features/auth/view/widgets/login/login_action.dart';
import 'package:chat_app/features/auth/view/widgets/login/login_text_btn_signup.dart';
import 'package:chat_app/features/auth/view/widgets/login/login_text_filed.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(Assets.splash, height: 300)),
              const LoginTextFiled(),
              const LoginAction(),
              const SizedBox(height: 20),
              const LoginTextBtnSignup(),
            ],
          ),
        ),
      ),
    );
  }
}
