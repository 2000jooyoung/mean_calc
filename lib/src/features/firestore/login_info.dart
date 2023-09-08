import 'package:firebase_auth/firebase_auth.dart';

class LoginInfo {
  static final LoginInfo _instance = LoginInfo._();

  LoginInfo._();

  String? userId;
  Future<void> initializeFirebaseAuth() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    UserCredential credential = await firebaseAuth.signInAnonymously();
    if (credential.user != null) {
      userId = credential.user!.uid;
    }
    return;
  }

  // Example method to get the user ID
  String? getUserId() {
    return userId;
  }

  factory LoginInfo() {
    _instance.initializeFirebaseAuth();
    return _instance;
  }
}
