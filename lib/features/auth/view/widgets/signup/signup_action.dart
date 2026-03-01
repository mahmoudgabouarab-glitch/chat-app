import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/features/auth/view_model/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupAction extends StatelessWidget {
  const SignupAction({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Btn(
      ontap: () {
        if (cubit.key.currentState!.validate()) {
          cubit.signupWithEmailAndPassword();
        }
      },
      text: 'Signup',
    );
  }
}
