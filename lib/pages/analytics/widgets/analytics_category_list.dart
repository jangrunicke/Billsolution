import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/pages/analytics/analytics_category_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnalyticsCategoryList extends StatefulWidget {
  @override
  _AnalyticsCategoryListState createState() => _AnalyticsCategoryListState();
}

class _AnalyticsCategoryListState extends State<AnalyticsCategoryList> {
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

  Widget _buildCategoryCard(String category, Color color) {
    return AnalyticsCategoryCard(
      category: category,
      color: color,
    );
  }

  _buildList(List<String> cats) {
    if (cats != null) {
      List<String> categories = _getDistinctCategories(cats);

      var cards = List<Widget>();
      int counter = 0;

      List<Color> colors = [
        Colors.red,
        Colors.orange,
        Colors.purple,
        Colors.green,
        Colors.blue,
        Colors.brown,
        Colors.yellow,
        Colors.amber
      ];
      categories.forEach((category) {
        cards.add(_buildCategoryCard(category, colors[counter]));
        counter = counter + 1;
      });

      return Container(
        height: 600,
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
