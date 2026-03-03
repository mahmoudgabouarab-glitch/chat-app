import 'package:chat_app/core/utils/app_color.dart';
import 'package:chat_app/core/widgets/custom_text_filed.dart';
import 'package:chat_app/features/home/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTextFiled extends StatelessWidget {
  const HomeTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Form(
      key: cubit.formKey,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 5, right: 5),
            child: ValueListenableBuilder(
              valueListenable: cubit.message,
              builder: (_, value, _) {
                return CustomTextFiled(
                  controller: cubit.message,
                  hint: "Message",
                  keybordtype: TextInputType.text,
                  suffix: value.text.isNotEmpty
                      ? IconButton(
                          onPressed: () => cubit.addMessage(),
                          icon: const Icon(Icons.send),
                          color: AppColor.primary,
                        )
                      : null,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
