// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billposition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Billposition _$BillpositionFromJson(Map<String, dynamic> json) {
  return Billposition(
    productName: json['productName'] as String,
    amount: (json['amount'] as num)?.toDouble(),
    price: (json['price'] as num)?.toDouble(),
    tax: (json['tax'] as num)?.toDouble(),
    discount: (json['discount'] as num)?.toDouble(),
    category: json['category'] as String,
  )..billId = json['billId'] as String;
}

Map<String, dynamic> _$BillpositionToJson(Billposition instance) =>
    <String, dynamic>{
      'billId': instance.billId,
      'productName': instance.productName,
      'amount': instance.amount,
      'price': instance.price,
      'tax': instance.tax,
      'discount': instance.discount,
      'category': instance.category,
    };
