import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mean_calc/src/models/target_subject.dart';
import 'package:mean_calc/src/models/target_users.dart';

class TaskRepository {
  TaskRepository({
    required this.userId,
  });

  final String userId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<TargeSubject>> getAllSubjectsFromUserId() async {
    final snapshot =
        _firestore.collection('users').doc(userId).collection('subjects');
    QuerySnapshot subjectQuery = await snapshot.get();
    List<TargeSubject> subjectsJsonList = subjectQuery.docs.map((subjectDoc) {
      return TargeSubject.fromJson(subjectDoc.data() as Map<String, dynamic>);
    }).toList();

    return subjectsJsonList;
  }

  Future<void> addSubject(TargeSubject task) async {
    final CollectionReference subjectsCollection =
        _firestore.collection('users').doc(userId).collection('subjects');

    final QuerySnapshot existingSubjects = await subjectsCollection
        .where('name', isEqualTo: task.name)
        .limit(1)
        .get();

    if (existingSubjects.docs.isNotEmpty) {
      print("exists");
      return;
    } else {
      subjectsCollection.add(task.toJson());
    }
  }

  Future<void> removeSubject(String subjectName) async {
    CollectionReference subjectsCollection =
        _firestore.collection('users').doc(userId).collection('subjects');

    QuerySnapshot querySnapshot =
        await subjectsCollection.where('name', isEqualTo: subjectName).get();

    if (querySnapshot.docs.isNotEmpty) {
      String documentId = querySnapshot.docs.first.id;
      await subjectsCollection.doc(documentId).delete();
    }
  }
}
