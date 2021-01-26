
import 'package:json_annotation/json_annotation.dart';

part 'vendor.g.dart';

/// ValueObject Vendor des Aggregates Bill im Sinne von DDD

@JsonSerializable()
class Vendor {
  String name;
  String category;

  Vendor({this.name, this.category});

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);

  Map<String, dynamic> toJson() => _$VendorToJson(this);
}
