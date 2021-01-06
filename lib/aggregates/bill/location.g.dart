// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    json['street'] as String,
    json['city'] as String,
    json['zip'] as String,
    json['country'] as String,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'zip': instance.zip,
      'country': instance.country,
    };
