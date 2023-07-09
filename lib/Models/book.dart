import 'package:cloud_firestore/cloud_firestore.dart';

class OurBook {
  String? id;
  String? name;
  int? length;
  Timestamp? dateCompleted;

  OurBook({this.id, this.name, this.length, this.dateCompleted});

  OurBook.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    length = map['length'];
    dateCompleted = map['dateCompleted'];
  }
}
