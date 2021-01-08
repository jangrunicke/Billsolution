import 'package:json_annotation/json_annotation.dart';

part 'billposition.g.dart';

@JsonSerializable()
class Billposition {
  @JsonKey(ignore: true)
  String id;
  String productName;
  double amount;
  double price;
  double tax;
  double discount;
  String category;

  Billposition(
      {this.productName,
      this.amount,
      this.price,
      this.tax,
      this.discount,
      this.category});

  factory Billposition.fromJson(Map<String, dynamic> json) =>
      _$BillpositionFromJson(json);

  Map<String, dynamic> toJson() => _$BillpositionToJson(this);
}
