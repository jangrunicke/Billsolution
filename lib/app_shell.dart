import 'package:billsolution_app/pages/analytics/analytics_router.dart';
import 'package:billsolution_app/pages/bills/bills_router.dart';
import 'package:billsolution_app/pages/scan/scan_router.dart';
import 'package:billsolution_app/pages/settings/settings_router.dart';
import 'package:flutter/material.dart';

class Destination {
  const Destination({this.title, this.icon, this.page});
  final String title;
  final IconData icon;
  final Widget page;
}

class AppShell extends StatefulWidget {
  @override
  _AppShellState createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  final List<Destination> allDestinations = <Destination>[
    Destination(icon: Icons.qr_code, title: 'Scannen', page: ScanRouter()),
    Destination(icon: Icons.receipt, title: 'Belege', page: BillsRouter()),
    Destination(
        icon: Icons.bar_chart, title: 'Auswertung', page: AnalyticsRouter()),
    Destination(
        icon: Icons.settings, title: 'Einstellungen', page: SettingsRouter()),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: allDestinations.map<Widget>((Destination destination) {
          return destination.page;
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
            label: destination.title,
            icon: Icon(destination.icon),
          );
        }).toList(),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
