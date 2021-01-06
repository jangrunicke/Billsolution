// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return Shop(
    name: json['name'] as String,
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    vendor: json['vendor'] == null
        ? null
        : Vendor.fromJson(json['vendor'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'vendor': instance.vendor,
    };
