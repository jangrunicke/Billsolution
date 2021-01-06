import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/repositorys/bill_repository.dart';

class BillService {
  // Singelton Pattern
  static final BillService _instance = BillService._internal();
  BillService._internal();
  factory BillService() => _instance;


  Stream<Bill> findById(String id) => BillRepository().findById(id);
  
  Stream<List<Bill>> find() { 
    // TODO: CriteriaObject implementation
    return BillRepository().find();
  }
}
