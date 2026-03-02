import 'package:chat_app/core/network/constant_collection_fb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FBHelper {
  // add message
  static Future<void> addMessage({required String message}) async {
    final int notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    var messages = FirebaseFirestore.instance.collection(FB.message);
    await messages.add({
      "messageId": notificationId,
      "id": FirebaseAuth.instance.currentUser!.uid,
      "sender": FirebaseAuth.instance.currentUser!.email,
      "message": message,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  // delete message
  static Future<void> deleteMessage({required String id}) async {
    await FirebaseFirestore.instance.collection(FB.message).doc(id).delete();
  }

  // update message
  static Future<void> updateMessage({
    required String editMessage,

    required String id,
  }) async {
    await FirebaseFirestore.instance.collection(FB.message).doc(id).update({
      "message": editMessage,
    });
  }

  // get message
  static Stream<QuerySnapshot<Map<String, dynamic>>> getMessage() {
    return FirebaseFirestore.instance
        .collection(FB.message)
        .orderBy("createdAt")
        .snapshots();
  }
}
