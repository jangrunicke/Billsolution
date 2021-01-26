import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/repositorys/billposition_repository.dart';

/// Billposition Serice um operation bezüglich des Billposition Objektes zu handeln
class BillpositionService {
  static final BillpositionService _instance = BillpositionService._internal();
  BillpositionService._internal();
  factory BillpositionService() => _instance;

  /// liefert alle Billpositions 
  Stream<List<Billposition>> find() {
    return BillpositionRepository().find();
  }

  /// liefert den Bill der IDs
  Stream<Billposition> findById(String id) {
    return BillpositionRepository().findById(id);
  }
}
