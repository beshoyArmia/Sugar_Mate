import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Features/auth/data/models/user_model.dart';
import 'package:e_commerce/Features/auth/domain/entities/user_entity.dart';

class firestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
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
      {required String path, required Map<String, dynamic> data});
  Future<Map<String, dynamic>> getData(
      {required String path, required String id});
}
