import 'package:chat_app/core/widgets/custom_text_filed.dart';
import 'package:chat_app/features/auth/view_model/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupTextFiled extends StatelessWidget {
  const SignupTextFiled({super.key});

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
          controller: context.read<SignupCubit>().email,
        ),
        SizedBox(height: 20),
        Text("Password"),
        SizedBox(height: 10),
        CustomTextFiled(
          keybordtype: TextInputType.visiblePassword,
          obscureText: true,
          hint: "********",
          controller: context.read<SignupCubit>().password,
        ),
        SizedBox(height: 20),
        Text("Confirm Password"),
        SizedBox(height: 10),
        CustomTextFiled(
          keybordtype: TextInputType.visiblePassword,
          obscureText: true,
          hint: "********",
          controller: context.read<SignupCubit>().confirmPassword,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
