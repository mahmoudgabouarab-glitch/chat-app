import 'package:chat_app/features/home/model/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OneOfMessage extends StatelessWidget {
  final MessageModel state;
  const OneOfMessage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final isMe = state.id == FirebaseAuth.instance.currentUser!.uid;
    return ConstrainedBox(
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
