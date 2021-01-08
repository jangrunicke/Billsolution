import 'package:billsolution_app/aggregates/bill/shop.dart';
import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/repositorys/billposition_repository.dart';
import 'package:billsolution_app/utils/datetime_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bill.g.dart';

@JsonSerializable(explicitToJson: true)
@DateTimeConverter()
class Bill {
  @JsonKey(ignore: true)
  String id;
  //TODO: Renaming
  DateTime created_at;
  String shopBillId;
  Shop shop;
  List<String> groups;
  String userId;

  Bill({this.created_at, this.shopBillId, this.shop, this.groups, this.userId});
  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);
  Map<String, dynamic> toJson() => _$BillToJson(this);

  Stream<List<Billposition>> getBillpositions() {
    return BillpositionRepository().findByBill(this.id);
  }

  Future<Billposition> addBillposition(Billposition billposition) {
    billposition.id = this.id;
    return BillpositionRepository().add(billposition);
  }

  Stream<double> getCalculatedSum() {
    return this.getBillpositions().map<double>((List<Billposition> bills) {
      double sum = 0;
      bills.forEach((Billposition billposition) {
        final double netto = billposition.price * billposition.amount;
        double brutto = netto + netto * billposition.tax;
        if (billposition.discount != null) {
          brutto = brutto * (1 - billposition.discount);
        }
        sum += brutto;
      });
      return sum;
    });
  }

  Stream<double> getCalculatedSumOfCategory(String category) {
    return this.getBillpositions().map<double>((List<Billposition> bills) {
      double sum = 0;
      bills.forEach((Billposition billposition) {
        if (billposition.category == category) {
          final double netto = billposition.price * billposition.amount;
          double brutto = netto + netto * billposition.tax;
          if (billposition.discount != null) {
            brutto = brutto * (1 - billposition.discount);
          }
          sum += brutto;
        }
      });
      return sum;
    });
  }
}
