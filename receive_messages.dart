import 'package:cloud_firestore/cloud_firestore.dart';

class ReceiveMessages {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> messageStream() {
    return _db.collection('messages').orderBy('timestamp', descending: true).snapshots();
  }
}

