import 'dart:async';
import 'dart:math';
import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/bill/vendor.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/pages/bills/models/zeitraum_filter_model.dart';
import 'package:billsolution_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'vendor_card.dart';

/// Widget, das der Darstellung der Liste von Vendor-Cards dient
class VendorList extends StatefulWidget {
  @override
  _VendorListState createState() => _VendorListState();
}

/// Status des Widgets
class _VendorListState extends State<VendorList> {
  /// Methode um eine Liste von Händlern zu bekommen ohne Duplikate und ohne
  ///   Elemente, die keine Bills im aktuellen Zeitfilterraum haben
  /// Parameter bills: Liste aller Bills eines Users
  /// Parameter lastValidDate: ermittelter Letzter Tag nach auswahl des Zeitraumfilters
  /// returned eine Liste von Objekten der Vendor-Klasse
  List<Vendor> _getDistinctVendors(List<Bill> bills, DateTime lastValidDate) {
    var vendornames = List<String>();
    var vendors = List<Vendor>();
    bills.removeWhere((element) => element.created_at.isBefore(lastValidDate));

    bills.map((bill) => bill.shop.vendor).forEach((vendor) {
      if (!vendornames.contains(vendor.name)) {
        vendornames.add(vendor.name);
        vendors.add(vendor);
      }
    });
    return vendors;
  }

  /// Methode um eine VendorCards zu bauen für einen Händler
  /// Parameter vendor: Der Händler für den die Karte gebaut werden soll
  /// Parameter lastValidDate: der letzte beachtete Tag, nach auswahl des Zeitraumfilters
  /// returned: eine VendorCard wenn, sobald die Daten des Streams da sind
  Widget _buildVendorCard(Vendor vendor, DateTime lastValidDate) {
    var zeitraumfilter = context.read<ZeitraumfilterModel>();
    var lastValidDate = zeitraumfilter.getLastValidDate();

    return Consumer<User>(builder: (context, user, child) {
      if (user != null) {
        return StreamBuilder(
            stream:
                user.calculatedSumOfVendor(vendor, startingAt: lastValidDate),
            builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.hasData) {
                return VendorCard(vendor.name, snapshot.data);
              }
              return Text('Waiting inner');
            });
      }
      return Text('Waiting');
    });
  }

  /// Methode um die Liste der Karten zu bauen.
  /// Parameter bills: die Liste der Belege eines Users.
  /// Parameter lastValidDate: der letzte beachtete Tag, unter Berücksichtigung des Zeitraumfilters.
  /// returned: ListView Widget, sobald die Liste der Bills vollkommmen geladen wurde
  Widget _buildList(List<Bill> bills, DateTime lastValidDate) {
    if (bills != null) {
      List<Vendor> vendors = _getDistinctVendors(bills, lastValidDate);

      var cards = List<Widget>();

      vendors.forEach((vendor) {
        cards.add(_buildVendorCard(vendor, lastValidDate));
      });

      return ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
        children: [
          ...cards,
        ],
      );
    }

    return Text('Waiting');
  }

  /// Build-Methode die aufgerufen wird von der Engine, sobald das Widget dargestellt werdens soll.
  /// returned: Container, der die Liste beinhaltet. Liste wurde in Methode
  ///   _buildList() ausgelagert.
  @override
  Widget build(BuildContext context) {
    var zeitraumfilter = context.watch<ZeitraumfilterModel>();
    var lastValidDate = zeitraumfilter.getLastValidDate();

    return Container(
        constraints: BoxConstraints(maxHeight: 140),
        child: Consumer<User>(
          builder: (context, user, child) {
            if (user != null) {
              return StreamBuilder(
                  stream: user.getBills(),
                  // .map((list) =>
                  //     list.map((Bill bill) => bill.shop.vendor))
                  // .map((list) => list.toList()),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Bill>> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error.toString());
                    }
                    if (snapshot.hasData) {
                      return _buildList(snapshot.data, lastValidDate);
                    }
                    return Text('Waiting');
                  });
            }
            return Text('Waiting');
          },
        ));
  }
}

class VendorCardData {
  String name;
  double aggPrice;

  VendorCardData({this.name, this.aggPrice});
}
