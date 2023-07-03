// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';
import 'package:book_club/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OurDataBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async {
    String retVal = "error";

    try {
      await _firestore.collection("users").doc(user.uid).set({
        'fullName': user.fullName,
        'email': user.email,
        'accountCreated': Timestamp.now(),
      }).onError((error, stackTrace) {
        log(error.toString());
      });
      retVal = "success";
    } catch (e) {
      log(e.toString());
    }
    return retVal;
  }

  Future<OurUser?> getUserInfo(String uid) async {
    OurUser retVal;
    try {
      var firestore = FirebaseFirestore.instance;
      DocumentSnapshot _docSnapshot =
          await firestore.collection("users").doc(uid).get();
      log(_docSnapshot.data().toString());

      retVal = OurUser.fromMap(_docSnapshot.data() as Map<String, dynamic>);

      return retVal;
    } catch (e) {
      log(e.toString());
      log("messagee");
    }
    return null;
  }

  Future<String> createGroup(String groupName, String userUid) async {
    String retVal = "error";
    List<dynamic> members = List.empty();

    try {
      members.add(userUid);
      DocumentReference _docRef = await _firestore.collection("groups").add({
        'name': groupName,
        'leader': userUid,
        'members': members,
        'groupCreated': Timestamp.now()
      });
      await _firestore
          .collection("users")
          .doc(userUid)
          .update({'groupId': _docRef.id});
      retVal = "success";
    } catch (e) {
      log(e.toString());
    }
    return retVal;
  }

  Future<String> joinGroup(String groupId, String userUid) async {
    String retVal = "error";
    List<String> members = List.empty();

    try {
      members.add(userUid);
      await _firestore.collection("groups").doc(groupId).update({
        'members': FieldValue.arrayUnion(members),
      });

      retVal = "success";
    } catch (e) {
      log(e.toString());
    }
    return retVal;
  }
}
