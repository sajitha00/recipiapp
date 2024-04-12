import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get Current User
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Sign in Anonymously (if not already signed in)
  Future<User?> signInAnonIfNeeded() async {
    if (_auth.currentUser == null) {
      try {
        UserCredential result = await _auth.signInAnonymously();
        return result.user;
      } catch (e) {
        print(e.toString());
        return null;
      }
    } else {
      return _auth.currentUser;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
    }
  }
}

