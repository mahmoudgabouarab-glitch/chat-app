import 'package:chat_app/core/widgets/custom_text_filed.dart';
import 'package:chat_app/features/auth/view_model/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginTextFiled extends StatelessWidget {
  const LoginTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email"),
          SizedBox(height: 10),
          CustomTextFiled(
            keybordtype: TextInputType.emailAddress,
            hint: "Email",
            controller: cubit.email,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please enter email';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          Text("Password"),
          SizedBox(height: 10),
          CustomTextFiled(
            keybordtype: TextInputType.visiblePassword,
            obscureText: true,
            hint: "********",
            controller: cubit.password,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please enter password';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
