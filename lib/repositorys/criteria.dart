import 'package:cloud_firestore/cloud_firestore.dart';

class Criteria {
  String field;
  String operator;
  dynamic value;

  Criteria({this.field, this.operator, this.value});

  Query addCriteriaToFirestoreQuery(Query query) {
    return Function.apply(query.where, [field], {Symbol(this.operator): value});
  }
}
