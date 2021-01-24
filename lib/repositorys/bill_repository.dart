import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/repositorys/criteria.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BillRepository {
  CollectionReference _collectionReference;

  static final BillRepository _instance = BillRepository._internal();

  factory BillRepository() => _instance;

  BillRepository._internal() {
    _collectionReference = FirebaseFirestore.instance.collection('bills');
  }

  Stream<List<Bill>> find({List<Criteria> criterias}) {
    // TODO: Error Handling
    Query query = _collectionReference;
    if (criterias != null) {
      criterias.forEach((Criteria criteria) {
        query = criteria.addCriteriaToFirestoreQuery(query);
      });
    }
    Stream<List<Bill>> billsStream = query
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.docs)
        .map((List<QueryDocumentSnapshot> documents) => documents
            .map((QueryDocumentSnapshot document) =>
                _buildBillFromDocumentSnapshot(document))
            .toList());

    return billsStream;
  }

  Stream<Bill> findById(String id) {
    return _collectionReference
        .doc(id)
        .snapshots()
        .map((DocumentSnapshot document) => Bill.fromJson(document.data()));
  }

  Stream<List<Bill>> findByUser(String userId) {
    return _collectionReference
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.docs)
        .map((List<QueryDocumentSnapshot> documents) => documents
            .map((QueryDocumentSnapshot document) =>
                _buildBillFromDocumentSnapshot(document))
            .toList());
  }

  Future<Bill> add(Bill bill) async {
    try {
      Map<String, dynamic> billAsJson = bill.toJson();
      DocumentReference documentReference =
          await _collectionReference.add(billAsJson);
      // TODO: Performance optimization, created bill will always be fetched for read again
      DocumentSnapshot document = await documentReference.get();
      Bill billFromBackend = _buildBillFromDocumentSnapshot(document);
      return billFromBackend;
    } catch (err) {
      print(err);
    }
  }

  Bill _buildBillFromDocumentSnapshot(DocumentSnapshot document) {
    Bill bill = Bill.fromJson(document.data());
    bill.id = document.id;
    return bill;
  }
}
