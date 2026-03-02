import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final DateTime? createdAt;
  final String id;
  final String message;
  final int messageId;
  final String sender;

  MessageModel({
    required this.createdAt,
    required this.id,
    required this.message,
    required this.messageId,
    required this.sender,
  });

  factory MessageModel.fromJson(
    QueryDocumentSnapshot<Map<String, dynamic>> json,
  ) {
    final data = json.data();
    return MessageModel(
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      id: data['id'] as String? ?? "",
      message: data['message'] as String? ?? "",
      messageId: data['messageId'] as int? ?? 0,
      sender: data['sender'] as String? ?? "",
    );
  }
}
