// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    birthdate: json['birthdate'] == null
        ? null
        : DateTime.parse(json['birthdate'] as String),
    email: json['email'] as String,
    groups: (json['groups'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthdate': instance.birthdate?.toIso8601String(),
      'email': instance.email,
      'groups': instance.groups,
    };
