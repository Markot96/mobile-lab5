import 'package:cloud_firestore/cloud_firestore.dart';

import 'model.dart';

class DB {
  final String documentId;

  DB({required this.documentId});

  CollectionReference reference =
      FirebaseFirestore.instance.collection("Coupon");
  Future setData(String name, String code, double discountPercent) async {
    return await reference.doc().set({
      "name": name,
      'code': code,
      "discountPercent": discountPercent,
    });
  }

  Future editTitle(String value) async {
    return await reference.doc(documentId).update({'name': value});
  }

  Future delete() async {
    return await reference.doc(documentId).delete();
  }

  List<Coupon> _dataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      // print((doc.data() as dynamic)['value']);
      return Coupon(
          id: (doc.id as dynamic) ?? '',
          name: (doc.data() as dynamic)['name'] ?? '',
          discountPercent: (doc.data() as dynamic)['discountPercent'] ?? 0.0,
          code: (doc.data() as dynamic)['code'] ?? 0);
    }).toList();
  }

  Stream<List<Coupon>> get data {
    return reference.snapshots().map(_dataFromSnapshot);
  }
}
