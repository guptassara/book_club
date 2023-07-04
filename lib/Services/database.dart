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
    List<dynamic> members = List.empty(growable: true);

    try {
      members.add(userUid);
      DocumentReference _docRef = await _firestore.collection("groups").add({
        'name': groupName,
        'leader': userUid,
        'members': members,
        'groupCreated': Timestamp.now(),
      });
      log(members.toString());
      log(_docRef.id);
      await _firestore
          .collection("users")
          .doc(userUid)
          .set({'groupID': _docRef.id});
      retVal = "success";
      log(userUid);
    } catch (e) {
      log(e.toString());
    }
    return retVal;
  }

  Future<String> joinGroup(String groupID, String userUid) async {
    String retVal = "error";
    List<String> members = List.empty(growable: true);

    try {
      members.add(userUid);
      await _firestore.collection("groups").doc(groupID).set({
        'members': FieldValue.arrayUnion(members),
      });
      await _firestore.collection("users").doc(userUid).set({
        'groupID': groupID,
      });

      retVal = "success";
      log(retVal);
    } catch (e) {
      log(e.toString());
    }
    return retVal;
  }
}
