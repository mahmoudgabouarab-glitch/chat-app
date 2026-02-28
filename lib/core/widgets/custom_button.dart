import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final void Function()? ontap;

  final String? text;
  final Color? color;
  final Widget? child;

  const Btn({
    super.key,
    required this.ontap,
    this.text,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          color ?? const Color(0xff665AF0),
        ),
      ),
      onPressed: ontap,
      child:
          child ??
          Center(
            child: Text(
              text ?? "",
              style: const TextStyle(color: Colors.white),
            ),
          ),
    );
  }
}
