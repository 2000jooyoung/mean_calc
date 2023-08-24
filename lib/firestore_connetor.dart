import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreConnector {
  FirestoreConnector(
    this.anonymousId,
  );

  final String anonymousId;

  List<Map<String, dynamic>> rowDicts = [];
  // will make method
  // 1. Read database from anonymous id
  // 2. Write a row with parameter <Map<String, dynamic>>

  Future<List<Map<String, dynamic>>> readDatabaseFromId() async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("cars").doc("123456789");

    try {
      DocumentSnapshot documentSnapshot = await documentReference.get();
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error getting document: $e');
    }
    return [];
  }
}
