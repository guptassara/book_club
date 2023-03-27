// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier {
  late String _uid;
  late String _email;

  String get getUid => _uid;

  String get getEmail => _email;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password) async {
    bool retVal = false;

    try {
      UserCredential _userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (_userCredential.user != null) {
        retVal = true;
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }

    return retVal;
  }

  Future<bool> logInUser(String email, String password) async {
    bool retVal = false;

    try {
      UserCredential _userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_userCredential.user != null) {
        _uid = _userCredential.user!.uid;
        _email = _userCredential.user!.email!;

        retVal = true;
      }
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}
