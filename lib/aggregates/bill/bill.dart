import 'package:billsolution_app/aggregates/bill/shop.dart';
import 'package:billsolution_app/utils/datetime_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bill.g.dart';

@JsonSerializable()
@DateTimeConverter()
class Bill {
  String id;
  DateTime created_at;
  String shopBillId;
  Shop shop;

  Bill({this.created_at, this.shopBillId, this.shop});
  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);
  Map<String, dynamic> toJson() => _$BillToJson(this);

}
