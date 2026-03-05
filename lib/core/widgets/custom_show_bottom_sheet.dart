import 'package:chat_app/core/utils/app_color.dart';
import 'package:chat_app/core/utils/extension.dart';
import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class CustomShowBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    TextEditingController? editMessageController,
    void Function()? ontap,
  }) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return showModalBottomSheet<T?>(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 8),
                Center(
                  child: Container(
                    width: 64,
                    height: 4,
                    color: AppColor.primary,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFiled(
                          hint: "Edit Message",
                          controller: editMessageController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter message ";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: SizedBox(
                            width: 150,
                            child: Btn(
                              ontap: () {
                                if (!formKey.currentState!.validate()) return;
                                ontap!();
                                context.popPage();
                              },
                              text: "confirm",
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
