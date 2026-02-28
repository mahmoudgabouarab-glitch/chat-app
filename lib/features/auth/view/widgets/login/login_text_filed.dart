import 'package:chat_app/core/widgets/custom_text_filed.dart';
import 'package:chat_app/features/auth/view_model/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginTextFiled extends StatelessWidget {
  const LoginTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email"),
        SizedBox(height: 10),
        CustomTextFiled(
          keybordtype: TextInputType.emailAddress,
          hint: "Email",
          controller: context.read<LoginCubit>().email,
        ),
        SizedBox(height: 20),
        Text("Password"),
        SizedBox(height: 10),
        CustomTextFiled(
          keybordtype: TextInputType.visiblePassword,
          obscureText: true,
          hint: "********",
          controller: context.read<LoginCubit>().password,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
