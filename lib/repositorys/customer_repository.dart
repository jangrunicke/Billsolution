import 'package:billsolution_app/aggregates/customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerRepository {
  CollectionReference _collectionReference;

  static final CustomerRepository _instance = CustomerRepository._internal();

  factory CustomerRepository() => _instance;

  CustomerRepository._internal() {
    _collectionReference = FirebaseFirestore.instance.collection('customers');
  }

  Stream<List<Customer>> find() {
    // TODO: Error Handling
    // TODO: Implement CriteriaObject for more specific quering
    return _collectionReference
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.docs)
        .map((List<QueryDocumentSnapshot> documents) => documents
            .map((QueryDocumentSnapshot document) =>
                Customer.fromJson(document.data()))
            .toList());
  }

  Stream<Customer> findById(String id) {
    // TODO: Error Handling
    return _collectionReference
        .doc(id)
        .snapshots()
        .map((DocumentSnapshot document) => Customer.fromJson(document.data()));
  }
}
