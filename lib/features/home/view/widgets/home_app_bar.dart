import 'package:chat_app/core/utils/extension.dart';
import 'package:chat_app/features/auth/view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Home"),
      actions: [
        IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            if (!context.mounted) return;
            context.pushAndRemoveUntil(LoginView());
          },
          icon: const Icon(Icons.exit_to_app_outlined),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
