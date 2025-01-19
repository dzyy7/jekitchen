import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference database =
      FirebaseFirestore.instance.collection("database");

  // Create
  Future<void> addData(String judul, String deskripsi) {
    return database.add({
      'Judul': judul,
      'Deskripsi': deskripsi,
      'timestamp': Timestamp.now(),
    });
  }

  // Read
  Stream<QuerySnapshot> getDatasStream() {
    return database.orderBy('timestamp', descending: true).snapshots();
  }

  // Update
  Future<void> updateData(String id, String judul, String deskripsi) {
    return database.doc(id).update({
      'Judul': judul,
      'Deskripsi': deskripsi,
      'timestamp': Timestamp.now(),
    });
  }

  // Delete
  Future<void> deleteData(String id) {
    return database.doc(id).delete();
  }
}
