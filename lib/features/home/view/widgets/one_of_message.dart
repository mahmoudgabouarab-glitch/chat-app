import 'package:chat_app/core/utils/app_color.dart';
import 'package:chat_app/core/utils/extension.dart';
import 'package:chat_app/core/widgets/custom_show_bottom_sheet.dart';
import 'package:chat_app/features/home/model/message_model.dart';
import 'package:chat_app/features/home/view_model/home_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OneOfMessage extends StatelessWidget {
  final MessageModel state;
  const OneOfMessage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final isMe = state.sender == FirebaseAuth.instance.currentUser!.email;
    return GestureDetector(
      onTap: () => _showDilog(
        context,
        onDelete: () => cubit.deleteMessage(id: state.docId),
        onEdit: () {
          context.popPage();
          cubit.editMessage.text = state.message;
          CustomShowBottomSheet.show(
            context: context,
            ontap: () => cubit.updateMessage(id: state.docId),
            editMessageController: cubit.editMessage,
          );
        },
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: isMe
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                state.sender,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isMe ? Colors.blue[400] : Colors.black45,
                  borderRadius: borderRadius(isMe),
                ),
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Text(
                state.createdAt != null
                    ? DateFormat('hh:mm a').format(state.createdAt!)
                    : "",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

BorderRadiusGeometry? borderRadius(bool isMe) {
  return isMe
      ? BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )
      : BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        );
}

void _showDilog(
  BuildContext context, {
  required void Function()? onDelete,
  required void Function()? onEdit,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () => context.popPage(),
            child: Icon(Icons.close, color: AppColor.error),
          ),
        ),
        content: const Text("Are you sure you want to delete this message?"),
        actions: [
          TextButton(onPressed: onEdit, child: Text("Edit")),
          ElevatedButton(
            onPressed: () {
              onDelete!();
              context.popPage();
            },
            child: Text("Delete", style: TextStyle(color: AppColor.error)),
          ),
        ],
      );
    },
  );
}
