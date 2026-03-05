import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final DateTime? createdAt;
  final String docId;
  final String message;
  final String sender;

  MessageModel({
    required this.createdAt,
    required this.message,
    required this.sender,
    required this.docId,
  });

  factory MessageModel.fromJson(
    QueryDocumentSnapshot<Map<String, dynamic>> json,
  ) {
    final data = json.data();
    return MessageModel(
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      message: data['message'] as String? ?? "",
      sender: data['sender'] as String? ?? "",
      docId: json.id as String? ?? "",
    );
  }
}
