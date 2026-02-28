import 'package:chat_app/features/auth/view/widgets/login/login_body.dart';
import 'package:chat_app/features/auth/view_model/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: LoginBody(),
    );
  }
}
