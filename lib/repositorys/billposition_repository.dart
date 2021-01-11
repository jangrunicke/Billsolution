import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/pages/bills/add_bill_position.dart';
import 'package:billsolution_app/repositorys/criteria.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BillpositionRepository {
  CollectionReference _collectionReference;
  // Singelton
  static final BillpositionRepository _instance =
      BillpositionRepository._internal();
  BillpositionRepository._internal() {
    _collectionReference =
        FirebaseFirestore.instance.collection('billpositions');
  }
  factory BillpositionRepository() => _instance;

  Stream<List<Billposition>> find({List<Criteria> criterias}) {
    // TODO: Error handling
    Query query = _collectionReference;
    if (criterias != null) {
      criterias.forEach((Criteria criteria) {
        query = criteria.addCriteriaToFirestoreQuery(query);
      });
    }
    Stream<List<Billposition>> result = query
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.docs)
        .map((List<QueryDocumentSnapshot> documents) => documents
            .map((QueryDocumentSnapshot document) =>
                _buildBillpositionFromDocumentSnapshot(document))
            .toList());

    return result;
  }

  Stream<Billposition> findById(String id) {
    return _collectionReference.doc(id).snapshots().map(
        (DocumentSnapshot document) =>
            _buildBillpositionFromDocumentSnapshot(document));
  }

  Stream<List<Billposition>> findByBill(String billId) {
    return _collectionReference
        .where('billId', isEqualTo: billId)
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.docs)
        .map((List<QueryDocumentSnapshot> documents) => documents
            .map((QueryDocumentSnapshot document) =>
                _buildBillpositionFromDocumentSnapshot(document))
            .toList());
  }

  Future<Billposition> add(Billposition billposition) async {
    try {
      Map<String, dynamic> billpositionAsJson = billposition.toJson();
      DocumentReference documentReference =
          await _collectionReference.add(billpositionAsJson);
      // TODO: Performance optimization, created bill will always be fetched for read again
      DocumentSnapshot document = await documentReference.get();
      Billposition billpositionFromBackend =
          _buildBillpositionFromDocumentSnapshot(document);
      return billpositionFromBackend;
    } catch (err) {
      // TODO: Error Handling
      print(err);
    }
  }

  Billposition _buildBillpositionFromDocumentSnapshot(
      DocumentSnapshot document) {
    Billposition billposition = Billposition.fromJson(document.data());
    billposition.id = document.id;
    return billposition;
  }
}
