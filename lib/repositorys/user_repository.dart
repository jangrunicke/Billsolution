import 'package:billsolution_app/aggregates/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  CollectionReference _collectionReference;

  static final UserRepository _instance = UserRepository._internal();

  factory UserRepository() => _instance;

  UserRepository._internal() {
    _collectionReference = FirebaseFirestore.instance.collection('users');
  }

  Stream<List<User>> find() {
    // TODO: Error Handling
    // TODO: Implement CriteriaObject for more specific quering
    return _collectionReference
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.docs)
        .map((List<QueryDocumentSnapshot> documents) => documents
            .map((QueryDocumentSnapshot document) =>
                _buildUserFromDocumentSnapshot(document))
            .toList());
  }

  Stream<User> findById(String id) {
    // TODO: Error Handling
    return _collectionReference
        .doc(id)
        .snapshots()
        .map((DocumentSnapshot document) => _buildUserFromDocumentSnapshot(document));
  }

  User _buildUserFromDocumentSnapshot(DocumentSnapshot document) {
    User user = User.fromJson(document.data());
    user.id = document.id;
    return user;
  }
}
