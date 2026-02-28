import 'package:chat_app/core/utils/assets.dart';
import 'package:chat_app/features/auth/view/widgets/signup/signup_action.dart';
import 'package:chat_app/features/auth/view/widgets/signup/signup_text_btn_login.dart';
import 'package:chat_app/features/auth/view/widgets/signup/signup_text_filed.dart';
import 'package:flutter/material.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

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
              SignupTextFiled(),
              SignupAction(),
              SignupTextBtnLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
