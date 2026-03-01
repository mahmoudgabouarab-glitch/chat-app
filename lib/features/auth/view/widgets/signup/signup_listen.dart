import 'package:chat_app/core/utils/app_color.dart';
import 'package:chat_app/core/utils/extension.dart';
import 'package:chat_app/core/widgets/custom_snakbar.dart';
import 'package:chat_app/features/auth/view_model/signup/signup_cubit.dart';
import 'package:chat_app/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupListen extends StatelessWidget {
  const SignupListen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        switch (state) {
          case SignupInitial():
          case SignupLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
            );
          case SignupSuccess():
            context.popPage();
            CustomSnackBar.show(
              context,
              message: "Signup successfully",
              type: SnackBarType.success,
            );
            context.pushAndRemoveUntil(HomeView());
          case SignupFailure():
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
