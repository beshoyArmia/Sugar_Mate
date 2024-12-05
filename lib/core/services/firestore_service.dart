import 'package:cloud_firestore/cloud_firestore.dart';

class firestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String id}) async {
    var data = await firestore.collection(path).doc(id).get();
    return data.data() as Map<String, dynamic>;
  }
}

abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});
  Future<Map<String, dynamic>> getData(
      {required String path, required String id});
}
