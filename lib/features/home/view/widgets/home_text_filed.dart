import 'package:chat_app/core/utils/app_color.dart';
import 'package:chat_app/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class HomeTextFiled extends StatelessWidget {
  const HomeTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = .new();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 5, right: 5),
          child: ValueListenableBuilder(
            valueListenable: textEditingController,
            builder: (_, value, _) {
              return CustomTextFiled(
                controller: textEditingController,
                hint: "Message",
                keybordtype: TextInputType.text,
                suffix: value.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send),
                        color: AppColor.primary,
                      )
                    : null,
              );
            },
          ),
        ),
      ),
    );
  }
}
