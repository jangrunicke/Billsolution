import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BillRepository {
  CollectionReference _collectionReference;

  static final BillRepository _instance = BillRepository._internal();

  factory BillRepository() => _instance;

  BillRepository._internal() {
    _collectionReference = FirebaseFirestore.instance.collection('bills');
  }

  Stream<List<Bill>> find() {
    // TODO: Error Handling
    // TODO: Implement CriteriaObject for more specific quering
    // TODO: Add Id to Bill Object
    return _collectionReference
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.docs)
        .map((List<QueryDocumentSnapshot> documents) => documents
            .map((QueryDocumentSnapshot document) =>
                Bill.fromJson(document.data()))
            .toList());
  }

  Stream<Bill> findById(String id) {
    return _collectionReference
        .doc(id)
        .snapshots()
        .map((DocumentSnapshot document) => Bill.fromJson(document.data()));
  }

  Stream<List<Bill>> findByUser(String userId) {
    return _collectionReference
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.docs)
        .map((List<QueryDocumentSnapshot> documents) => documents
            .map((QueryDocumentSnapshot document) =>
                Bill.fromJson(document.data()))
            .toList());
  }

  _buildBillFromDocumentSnapshot(DocumentSnapshot document) {
    Bill bill = Bill.fromJson(document.data());
    bill.id = document.id;
    return bill;
  }
}
