import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> sendMessage(String message, String userId) async {
    try {
      await _db.collection('messages').add({
        'text': message,
        'authorId': userId,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print(e.toString());
    }
  }
}

