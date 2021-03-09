import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  User user;
  User currentUser;
  String errorMessage = '';
  Future<User> handleSignUp({email, password}) async {
    try {
      user = (await auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
    } catch (e) {
      errorMessage = e.toString();
    }

    return user;
  }

  Future<User> handleSignInEmail({String email, String password}) async {
    try {
      user = (await auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
    } catch (e) {
      errorMessage = e.toString();
      print(errorMessage);
    }

    currentUser = auth.currentUser;
    print(currentUser);
    print('signInEmail succeeded: $user');

    return user;
  }
}
