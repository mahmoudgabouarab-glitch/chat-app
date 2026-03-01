import 'package:chat_app/core/utils/app_color.dart';
import 'package:chat_app/core/utils/extension.dart';
import 'package:chat_app/core/widgets/custom_snakbar.dart';
import 'package:chat_app/features/auth/view_model/login/login_cubit.dart';
import 'package:chat_app/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginListen extends StatelessWidget {
  const LoginListen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LoginInitial():
          case LoginLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
            );
          case LoginSuccess():
            context.popPage();
            CustomSnackBar.show(
              context,
              message: "Login successfully",
              type: SnackBarType.success,
            );
            context.pushAndRemoveUntil(HomeView());
          case LoginFailure():
            context.popPage();
            CustomSnackBar.show(
              context,
              message: state.message,
              type: SnackBarType.error,
            );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
