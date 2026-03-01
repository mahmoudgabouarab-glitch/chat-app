import 'package:chat_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color backgroundColor;
    Icon icon;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = AppColor.success;
        icon = const Icon(Icons.check_circle, color: AppColor.textbtn);
        break;
      case SnackBarType.error:
        backgroundColor = AppColor.error;
        icon = const Icon(Icons.error, color: AppColor.textbtn);
        break;
      case SnackBarType.warning:
        backgroundColor = AppColor.primary;
        icon = const Icon(Icons.warning, color: AppColor.textbtn);
        break;
      default:
        backgroundColor = AppColor.textbtn;
        icon = const Icon(Icons.info, color: AppColor.textbtn);
    }

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      duration: duration,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Row(
        children: [
          icon,
          SizedBox(width: 12),

          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: AppColor.textbtn,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

enum SnackBarType { success, error, warning, info }
