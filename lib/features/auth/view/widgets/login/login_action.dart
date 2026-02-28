import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/features/auth/view_model/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginAction extends StatelessWidget {
  const LoginAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Btn(
      ontap: () => context.read<LoginCubit>().loginWithEmailAndPassword(),
      text: 'Login',
    );
  }
}
