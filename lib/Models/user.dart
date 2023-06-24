import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String? uid;
  String? fullName;
  String? email;
  Timestamp? accountCreated;
  String? groupID;

  OurUser({
    this.uid,
    this.email,
    this.fullName,
    this.accountCreated,
    this.groupID,
  });
}
