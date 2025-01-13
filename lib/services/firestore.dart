import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference database =
      FirebaseFirestore.instance.collection("database");

  //create
  Future<void> addData(String judul) {
    return database.add({
      'Judul': judul,
      'timestamp': Timestamp.now(),
    });
  }

  //read
  Stream<QuerySnapshot> getDatasStream() {
    final dataStream =
        database.orderBy('timestamp', descending: true).snapshots();

    return dataStream;
  }

  //update
}
