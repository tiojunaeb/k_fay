import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get usuario {
    return firebaseAuth.authStateChanges();
  }
}