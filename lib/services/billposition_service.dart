import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/repositorys/billposition_repository.dart';

class BillpositionService {
  static final BillpositionService _instance = BillpositionService._internal();
  BillpositionService._internal();
  factory BillpositionService() => _instance;

  Stream<List<Billposition>> find() {
    return BillpositionRepository().find();
  }

  Stream<Billposition> findById(String id) {
    return BillpositionRepository().findById(id);
  }
}
