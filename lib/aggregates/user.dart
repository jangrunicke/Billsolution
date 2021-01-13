import 'dart:async';

import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/bill/vendor.dart';
import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/repositorys/bill_repository.dart';
import 'package:billsolution_app/repositorys/criteria.dart';
import 'package:billsolution_app/utils/datetime_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rxdart/streams.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
@DateTimeConverter()
class User {
  String id;
  final String firstName;
  final String lastName;
  DateTime birthdate;
  final String email;
  // TODO: Capsulation -> shallow copy for getter
  List<String> groups;

  User(
      {@required this.firstName,
      @required this.lastName,
      this.birthdate,
      @required this.email,
      this.groups});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  Stream<List<Bill>> getBills() {
    return BillRepository().findByUser(this.id);
  }

  Future<Bill> addBill(Bill bill) {
    bill.userId = this.id;
    return BillRepository().add(bill);
  }

  Stream<double> calculateSumOfCategory(String category) async* {
    await for (List<Bill> bills in this.getBills()) {
      List<Stream<double>> streams = List<Stream<double>>();
      bills.forEach((Bill bill) {
        streams.add(bill.getCalculatedSumOfCategory(category));
      });
      Stream<List<double>> combinedStream = CombineLatestStream.list(streams);
      Stream<double> sumStream = combinedStream.map<double>(
          (List<double> list) => list.fold(
              0, (previousValue, element) => previousValue + element));
      // Flattening streams
      yield* sumStream;
    }
  }

  Stream<double> calculatedSumOfVendor(
      Vendor vendor,{ DateTime startingAt }) async* {
    assert(vendor != null);
    List<Criteria> criterias = [];

    if (vendor.name != null) {
      criterias.add(Criteria(
          field: 'shop.vendor.name',
          operator: 'isEqualTo',
          value: vendor.name));
    }

    if (vendor.category != null) {
      criterias.add(Criteria(
          field: 'shop.vendor.category',
          operator: 'isEqualTo',
          value: vendor.category));
    }

    if (startingAt != null) {
      criterias.add(Criteria(
        field: 'created_at',
        operator: 'isGreaterThanOrEqualTo',
        value: startingAt,
      ));
    }

    Stream<List<Bill>> billsStream =
        BillRepository().find(criterias: criterias);

    await for (List<Bill> bills in billsStream) {
      List<Stream<double>> streams = List<Stream<double>>();
      bills.forEach((Bill bill) {
        streams.add(bill.getCalculatedSum());
      });
      Stream<List<double>> combinedStream = CombineLatestStream.list(streams);
      Stream<double> sumStream = combinedStream.map<double>(
          (List<double> list) => list.fold(
              0, (previousValue, element) => previousValue + element));

      yield* sumStream;
    }
  }
}
