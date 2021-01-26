import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/pages/analytics/analytics_category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/**
 * Eine Klasse um die Verschiedene Kategorien eines Users abzufragen und sie dann
 als Cards anzeigen zu lassen
 */

class AnalyticsCategoryList extends StatefulWidget {
  @override
  _AnalyticsCategoryListState createState() => _AnalyticsCategoryListState();
}

class _AnalyticsCategoryListState extends State<AnalyticsCategoryList> {
  /**
   * Funktion die eine Duplikatsgfreie Liste von Kategorien zurückliefert
   */
  List<String> _getDistinctCategories(List<String> cats) {
    var categorynames = List<String>();
    cats.forEach((category) {
      if (!categorynames.contains(category)) {
        categorynames.add(category);
      }
    });
    categorynames.sort();
    return categorynames;
  }

  /**
   * Funktion die ein Widget (AnalyticsCategoryCad) je nach Category 
   * zurückliefert
   */
  Widget _buildCategoryCard(String category, Color color) {
    return AnalyticsCategoryCard(
      category: category,
      color: color,
    );
  }

/**
 * Funktion die eine Liste von Widgets erstellt und ihnen Farben zuordnet
 */
  _buildList(List<String> cats) {
    if (cats != null) {
      List<String> categories = _getDistinctCategories(cats);

      var cards = List<Widget>();
      int counter = 0;

      List<Color> colors = [
        Colors.red,
        Colors.green,
        Colors.orange,
        Colors.blue,
        Colors.purple,
        Colors.brown,
        Colors.grey,
        Colors.lightGreen,
        Colors.pink,
        Colors.teal,
        Colors.deepOrange,
      ];

      categories.forEach((category) {
        cards.add(_buildCategoryCard(category, colors[counter]));
        counter = counter + 1;
      });

      return Container(
        child: ListView(
          children: [
            ...cards,
          ],
        ),
      );
    }
    return Text('Waiting');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<User>(
        builder: (context, user, child) {
          if (user == null) {
            return Text('Waiting');
          }
          return StreamBuilder(
            stream: user.getAllCategories(),
            builder: (BuildContext context,
                AsyncSnapshot<List<List<String>>> snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (!snapshot.hasData) {
                return Text('Empty');
              }
              List<String> list = new List<String>();
              snapshot.data.forEach((element) {
                element.forEach((element) {
                  list.add(element);
                });
              });
              return _buildList(list);
            },
          );
        },
      ),
    );
  }
}
