import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/repositorys/criteria.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Repository für das AggregateRoot Bill im Sinne von DDD
/// stellt also die Schnittstelle zwischen der Entity Bill und der Datenbank dar

class BillRepository {
  CollectionReference _collectionReference;

  /// Singelton Pattern Instanz erstellung
  static final BillRepository _instance = BillRepository._internal();

  factory BillRepository() => _instance;

  BillRepository._internal() {
    _collectionReference = FirebaseFirestore.instance.collection('bills');
  }

  /// Finde alle Bills in der Datenbank anhand von Kriterien und liefer diese anhand eines Streams zurück (RealtimeData)
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

  /// Finde den Bill anhand seiner Id
  Stream<Bill> findById(String id) {
    return _collectionReference
        .doc(id)
        .snapshots()
        .map((DocumentSnapshot document) => Bill.fromJson(document.data()));
  }

  /// Finde alle Bills anhand der UserId
  Stream<List<Bill>> findByUser(String userId) {
    return _collectionReference
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.docs)
        .map((List<QueryDocumentSnapshot> documents) => documents
            .map((QueryDocumentSnapshot document) =>
                _buildBillFromDocumentSnapshot(document))
            .toList());
  }

  /// Füge einen Bill dem User hinzu
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

  /// Baue ein Bill Object aus einem Firebase DocumentSnapshot Objekts
  Bill _buildBillFromDocumentSnapshot(DocumentSnapshot document) {
    Bill bill = Bill.fromJson(document.data());
    bill.id = document.id;
    return bill;
  }
}
