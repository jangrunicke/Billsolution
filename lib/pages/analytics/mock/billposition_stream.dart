import 'package:billsolution_app/pages/analytics/mock/billposition_class.dart';

class BillpositionStream {
  List<Billposition> createList() {
    List<Billposition> liste = new List<Billposition>();
    liste.add(new Billposition(
        name: 'Hose', amount: 3, price: 20.0, category: 'Klamotten'));
    liste.add(new Billposition(
        name: 'Batterien', amount: 3, price: 20.0, category: 'Elektronik'));
    liste.add(new Billposition(
        name: 'Salami', amount: 3, price: 20.0, category: 'Lebensmittel'));
    liste.add(new Billposition(
        name: 'Wurst', amount: 3, price: 20.0, category: 'Lebensmittel'));
    liste.add(new Billposition(
        name: 'Zahnbürste', amount: 3, price: 20.0, category: 'Hygiene'));
    liste.add(new Billposition(
        name: 'Zahnpasta', amount: 3, price: 20.0, category: 'Hygiene'));
    return liste;
  }

  Stream getStream() {
    List<Billposition> billPositionList = createList();
    var stream = new Stream.fromIterable(billPositionList);
    return stream;
  }
}
