import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final db = FirebaseFirestore.instance;

  Future<void> createItem(String item) async {
    await db.collection('item').add({
      'item': item,
      'createdAt': Timestamp.fromDate(DateTime.now()),
    });
  }
}
