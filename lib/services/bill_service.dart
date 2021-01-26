import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/repositorys/bill_repository.dart';

/// Service um Operation eines Billobjekts zu handeln

class BillService {
  // Singelton Pattern
  static final BillService _instance = BillService._internal();
  BillService._internal();
  factory BillService() => _instance;

  /// liefert ein Bill anhand seiner ID
  Stream<Bill> findById(String id) => BillRepository().findById(id);
  
  /// liefert alle Bills
  Stream<List<Bill>> find() { 
    // TODO: CriteriaObject implementation
    return BillRepository().find();
  }
}
