import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String sender;
  final String receiver;
  final String message;
  final DateTime timestamp;

  Chat({
    required this.sender,
    required this.receiver,
    required this.message,
    required this.timestamp,
  });
}

class ChatService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Send message
  Future<void> sendMessage(String receiverId, String message) async {
    String currentUserId = _auth.currentUser!.uid;

    await _firestore.collection('chats').add({
      'sender': currentUserId,
      'receiver': receiverId,
      'message': message,
      'timestamp': DateTime.now(),
    });
  }

  // Get messages 
  Stream<List<Chat>> getMessagesWith(String userId) {
    String currentUserId = _auth.currentUser!.uid;

    return _firestore
        .collection('chats')
        .where('sender', whereIn: [currentUserId, userId])
        .where('receiver', whereIn: [currentUserId, userId])
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return Chat(
                sender: doc['sender'],
                receiver: doc['receiver'],
                message: doc['message'],
                timestamp: doc['timestamp'].toDate(),
              );
            }).toList());
  }
}
// මේ චැට් ෆන්ශන් එක,
// යූසර් කෙනෙක් සයින් අප් උනාම එයාට අදාල වෙන iud  එක හරහා හදන චැට් රූම්  එකට ෆොවඩ් වෙනවා. 