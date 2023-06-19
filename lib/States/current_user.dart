// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:book_club/Services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Models/user.dart';

class CurrentUser extends ChangeNotifier {
  late OurUser? _currentUser = OurUser();

  OurUser? get getcurrentUser => _currentUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> onStartUp() async {
    String retVal = "error";

    try {
      User _firebaseUser = await _auth.currentUser!;
      _currentUser = await OurDataBase().getUserInfo(_firebaseUser.uid);
      if (_currentUser != null) {
        retVal = "success";
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String?> signOut() async {
    String retVal = "error";

    try {
      await _auth.signOut();
      _currentUser = OurUser();

      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String?> signUpUser(
      String email, String password, String fullName) async {
    String? retVal = "error";
    OurUser _user = OurUser();

    try {
      UserCredential _userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      _user.email = email;
      _user.fullName = fullName;
      String _returnString = await OurDataBase().createUser(_user);

      if (_returnString == "success") {
        retVal = "success";
      }
    } on FirebaseAuthException catch (e) {
      retVal = e.message;
    }

    return retVal;
  }

  Future<String?> logInUserWithEmail(String email, String password) async {
    String? retVal = "error";

    try {
      UserCredential _userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _currentUser = await OurDataBase().getUserInfo(_userCredential.user!.uid);
      if (_currentUser != null) {
        retVal = "success";
      }
    } on FirebaseAuthException catch (e) {
      retVal = e.message;
    }

    return retVal;
  }

  Future<String?> logInUserWithGoogle() async {
    String? retVal = "error";
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    OurUser _user = OurUser();

    try {
      GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth =
          await _googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
      UserCredential _userCredential =
          await _auth.signInWithCredential(credential);
      if (_userCredential.additionalUserInfo!.isNewUser) {
        _user.uid = _userCredential.user!.uid;
        _user.email = _userCredential.user!.email!;
        _user.fullName = _userCredential.user!.displayName;
        OurDataBase().createUser(_user);
      }
      _currentUser = await OurDataBase().getUserInfo(_userCredential.user!.uid);
      if (_currentUser != null) {
        retVal = "success";
      }
    } on FirebaseAuthException catch (e) {
      retVal = e.message;
    }

    return retVal;
  }
}
