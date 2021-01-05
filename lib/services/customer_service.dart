import 'package:billsolution_app/aggregates/customer.dart';
import 'package:billsolution_app/repositorys/customer_repository.dart';

class CustomerService {
  static CustomerService _instance;

  static get instance {
    if (_instance == null) {
      _instance = CustomerService._internal();
    }
    return _instance;
  }

  CustomerService._internal();

  Stream<Customer> findById(String id) {
    return CustomerRepository().findById(id);
  }

  Stream<List<Customer>> find() {
    // TODO: CriteriaObject implementation
    return CustomerRepository().find();
  }
}
