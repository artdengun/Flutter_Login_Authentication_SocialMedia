

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
   TextEditingController _emailController = TextEditingController(text: "");
   TextEditingController _passController = TextEditingController(text: "");

  static FirebaseAuth _auth = FirebaseAuth.instance;


  static Future<SignInSignUpResult> createUser({String email, String pass}) async {
    try {
      AuthResult result = await
      _auth.createUserWithEmailAndPassword(email: email.trim(), password: pass);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<SignInSignUpResult> signInWithEmail({String email, String pass}) async {
    try {
      AuthResult result = await
      _auth.signInWithEmailAndPassword(email: email, password: pass);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static void signOut() {
    _auth.signOut();
  }

}


class SignInSignUpResult {
  final FirebaseUser user;
  final String message;
  SignInSignUpResult({this.user, this.message});
}
