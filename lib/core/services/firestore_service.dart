import 'package:cloud_firestore/cloud_firestore.dart';

class firestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }
}

abstract class DatabaseService {
  Future<void> addData(
      {required String path, required Map<String, dynamic> data});
}
