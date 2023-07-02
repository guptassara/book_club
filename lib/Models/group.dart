import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String? id;
  String? name;
  String? leader;
  Timestamp? groupCreated;
  List<String>? members;

  OurUser({this.id, this.leader, this.name, this.groupCreated, this.members});

  OurUser.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    leader = map['leader'];
    groupCreated = map['groupCreated'];
    members = map['members'];
  }
}
