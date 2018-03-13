import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:happy/drawer/menu.dart';

class TestsPage extends StatefulWidget {
  TestsPage({Key key, this.title}) : super(key: key);

  static const String routeName = "TestsPage";

  final String title;

  @override
  _TestsPageState createState() => new _TestsPageState();
}

class _TestsPageState extends State<TestsPage> {
  List data;
  bool loading = true;

  _getFromServer() async {
    var response = await http.get(Uri.encodeFull("https://api.massinflux.com/scuba/quiz.php?type=quiz&json"), headers: {"Accept": "application/json"});

    setState(() {
      this.data = JSON.decode(response.body);
      loading = false;
    });
  }


  Future<String> _getData() async {
    _getFromServer();

    return "Success!";
  }

  var loadingIndicator = new Center(child: new Padding(padding: const EdgeInsets.only(left: 16.0, right: 16.0), child: new CircularProgressIndicator()));

  @override
  void initState() {
    this._getData();
  }

  @override
  Widget build(BuildContext context) {
    Menu drawer = new Menu();

    return new Scaffold(
        drawer: drawer,
        appBar: new AppBar(
          title: new Text('Scuba Tests'),
        ),
        body: loading
            ? loadingIndicator
            : new ListView.builder(
                itemCount: this.data == null ? 0 : this.data.length,
                itemBuilder: (BuildContext context, int i) {
                  return new ListTile(
                    title: new Text(this.data[i]['name'], style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                    subtitle: new Text(this.data[i]['data'][0]['title']),
                    leading: new Icon(
                      Icons.assignment,
                      color: Colors.blue[500],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, TestsPage.routeName + "/${i}/0");
                    },
                  );
                }));
  }
}
