import 'dart:core';
import 'package:flutter/material.dart';
import 'package:happy/screens/home.dart';
import 'package:happy/screens/tests.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new HomePage(title: 'Scuba Tests'),
        routes: <String, WidgetBuilder>{
          TestsPage.routeName: (BuildContext context) => new TestsPage(title: 'Tests Page'),
        },
        onGenerateRoute: (routeSettings) {
          print('Toute Change');
          print(routeSettings);

          var path = routeSettings.name.split('/');
          final id = path.length > 1 ? int.parse(path[1]) : null;
          final qid = path.length > 2 ? int.parse(path[2]) : null;

          if (path[0] == TestsPage.routeName) {
            return new MaterialPageRoute(
              builder: (context) => new TestsPage(id: id, qid: qid),
              settings: routeSettings,
            );
          }
        });
  }
}
