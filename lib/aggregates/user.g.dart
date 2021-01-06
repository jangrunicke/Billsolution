// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    birthdate:
        const DateTimeConverter().fromJson(json['birthdate'] as Timestamp),
    email: json['email'] as String,
    groups: (json['groups'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthdate': const DateTimeConverter().toJson(instance.birthdate),
      'email': instance.email,
      'groups': instance.groups,
    };
