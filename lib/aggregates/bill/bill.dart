import 'dart:math';

import 'package:billsolution_app/aggregates/bill/shop.dart';
import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/repositorys/bill_repository.dart';
import 'package:billsolution_app/repositorys/billposition_repository.dart';
import 'package:billsolution_app/repositorys/criteria.dart';
import 'package:billsolution_app/utils/datetime_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bill.g.dart';

@JsonSerializable(explicitToJson: true)
@DateTimeConverter()
class Bill {
  @JsonKey(ignore: true)
  String id;
  //TODO: Renaming
  DateTime created_at;
  String shopBillId;
  Shop shop;
  List<String> groups;
  String userId;

  Bill({this.created_at, this.shopBillId, this.shop, this.groups, this.userId});
  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);
  Map<String, dynamic> toJson() => _$BillToJson(this);

  Stream<List<Billposition>> getBillpositions() {
    return BillpositionRepository().findByBill(this.id);
  }

  Future<Billposition> addBillposition(Billposition billposition) {
    billposition.billId = this.id;
    return BillpositionRepository().add(billposition);
  }

  Stream<double> getCalculatedSum() {
    return this.getBillpositions().map<double>((List<Billposition> bills) {
      double sum = 0;
      bills.forEach((Billposition billposition) {
        sum += _calculateBillposition(billposition);
      });
      return sum;
    });
  }

  Stream<List<String>> getCategories() {
    return this
        .getBillpositions()
        .map<List<String>>((List<Billposition> bills) {
      List<String> categories = List<String>();
      bills.forEach((Billposition billposition) {
        categories.add(billposition.category);
      });
      return categories;
    });
  }

  // double roundDouble(double value, int places) {
  //   double mod = pow(10.0, places);
  //   return ((value * mod).round().toDouble() / mod);
  // }

  Stream<double> getCalculatedSumOfCategory(String category) {
    List<Criteria> criterias = [
      Criteria(field: 'category', operator: 'isEqualTo', value: category),
      Criteria(field: 'billId', operator: 'isEqualTo', value: this.id),
    ];

    Stream<double> sum = BillpositionRepository()
        .find(criterias: criterias)
        .map<double>((List<Billposition> billpositions) {
      double sum = 0;
      billpositions.forEach((Billposition billposition) {
        sum += _calculateBillposition(billposition);
      });
      return sum;
    });

    return sum;
  }

  double _calculateBillposition(Billposition billposition) {
    final double netto = billposition.price * billposition.amount;
    double brutto = netto + netto * billposition.tax;
    if (billposition.discount != null) {
      brutto = brutto * (1 - billposition.discount);
    }
    return brutto;
  }
}
