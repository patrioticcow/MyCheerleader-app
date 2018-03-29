import 'package:flutter/material.dart';
import 'package:happy/drawer/menu.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  static const String routeName = "/";

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Menu drawer = new Menu();

    return new Scaffold(
        drawer: drawer,
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Column(
          children: [
            new Column(
              children: [
                new Text('Cheer'),
              ],
            ),

            
            new Row(
              children: [
                new Expanded(
                  child: new Container(
                    padding: new EdgeInsets.all(8.0),
                    child: new RaisedButton(
                      child: new Text('Show new cheer'),
                      onPressed: (){},
                    ),
                  ),
                ),
              ],
            ),

            new Row(
              children: [
                new Expanded(
                  child: new Container(
                    padding: new EdgeInsets.all(8.0),
                    child: new RaisedButton(
                      child: new Text('Share cheer'),
                      onPressed: (){},
                    ),
                  ),
                ),
              ],
            ),

            new Row(
              children: [
                new Expanded(
                  child: new Container(
                    padding: new EdgeInsets.all(8.0),
                    child: new RaisedButton(
                      child: new Text('Start meditation'),
                      onPressed: (){},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
