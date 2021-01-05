import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  final String firstName;
  final String lastName;
  DateTime birthdate;
  final String email;
  // TODO: Capsulation -> shallow copy for getter
  List<String> groups;

  Customer(
      {@required this.firstName,
      @required this.lastName,
      this.birthdate,
      @required this.email,
      this.groups});

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
  

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
