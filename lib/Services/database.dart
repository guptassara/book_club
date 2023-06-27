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

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal = OurUser();
    try {
      var firestore = FirebaseFirestore.instance;
      DocumentSnapshot _docSnapshot =
          await firestore.collection("users").doc(uid).get();
      // Object? data = _docSnapshot.data();
      retVal.uid = uid;
      Map<String, dynamic>? data = _docSnapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        retVal.fullName = data["fullName"] as String?;
      } else {
        retVal.fullName = null;
      }
      if (data != null) {
        retVal.email = data["email"] as String?;
      } else {
        retVal.email = null;
      }
      if (data != null) {
        retVal.accountCreated = data["accountCreated"] as Timestamp?;
      } else {
        retVal.accountCreated = null;
      }
      if (data != null) {
        retVal.groupID = data["groupID"] as String?;
      } else {
        retVal.groupID = null;
        log("GroupID is null");
      }
      // retVal.email = _docSnapshot.get("email");
      // retVal.accountCreated = _docSnapshot.get("accountCreated");
      // retVal.groupID = _docSnapshot.get("groupID");
      // log(retVal.groupID as String);
      log("w");
      log(retVal.groupID as String);
    } catch (e) {
      log(e.toString());
      log("messagee");
    }
    return retVal;
  }
}
