import 'package:billsolution_app/aggregates/bill/location.dart';
import 'package:billsolution_app/aggregates/bill/vendor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop.g.dart';

@JsonSerializable()
class Shop {
  String name;
  Location location;
  Vendor vendor;

  Shop({this.name, this.location, this.vendor});

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);

  Map<String, dynamic> toJson() => _$ShopToJson(this);
}
