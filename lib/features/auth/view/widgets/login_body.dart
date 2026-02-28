import 'package:chat_app/core/utils/assets.dart';
import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/core/widgets/custom_text_filed.dart';
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
              Text("Email"),
              SizedBox(height: 10),
              CustomTextFiled(),
              SizedBox(height: 20),
              Text("Password"),
              SizedBox(height: 10),
              CustomTextFiled(),
              SizedBox(height: 20),
              Btn(ontap: () {}, text: 'Login', ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(onPressed: () {}, child: Text("Sign Up")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
