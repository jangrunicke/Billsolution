// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) {
  return Bill(
    created_at:
        const DateTimeConverter().fromJson(json['created_at'] as Timestamp),
    shopBillId: json['shopBillId'] as String,
    shop: json['shop'] == null
        ? null
        : Shop.fromJson(json['shop'] as Map<String, dynamic>),
  )..id = json['id'] as String;
}

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': const DateTimeConverter().toJson(instance.created_at),
      'shopBillId': instance.shopBillId,
      'shop': instance.shop,
    };
