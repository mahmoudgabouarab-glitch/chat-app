import 'package:chat_app/core/utils/app_color.dart';
import 'package:flutter/cupertino.dart';

class CustomLoading extends StatelessWidget {
  final double? size;
  final Color? color;
  const CustomLoading({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color ?? AppColor.primary,
        radius: size ?? 20,
      ),
    );
  }
}
