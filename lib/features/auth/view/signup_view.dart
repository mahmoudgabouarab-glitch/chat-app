import 'package:chat_app/features/auth/view/widgets/signup/signup_body.dart';
import 'package:chat_app/features/auth/view_model/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignupCubit(),
      child: SignupBody(),
    );
  }
}
