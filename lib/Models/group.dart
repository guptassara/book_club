import 'package:cloud_firestore/cloud_firestore.dart';

class OurGroup {
  String? id;
  String? name;
  String? leader;
  Timestamp? groupCreated;
  List<String>? members;
  String? currentBookID;
  Timestamp? currentBookDue;

  OurGroup(
      {this.id,
      this.leader,
      this.name,
      this.groupCreated,
      this.members,
      this.currentBookDue,
      this.currentBookID});

  OurGroup.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    leader = map['leader'];
    groupCreated = map['groupCreated'];
    members = map['members'];
    currentBookID = map["currentBookID"];
    currentBookDue = map["currentBookDue"];
  }
}
