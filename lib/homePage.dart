import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'messageList.dart';
import 'camera.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> list = <Widget>[
    ListTile(
      title: Text('CineArts at the Empire',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: Text('85 W Portal Ave'),
      leading: Icon(
        Icons.theaters,
        color: Colors.blue[500],
      ),
    ),
    ListTile(
      title: Text('The Castro Theater',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: Text('429 Castro St'),
      leading: Icon(
        Icons.theaters,
        color: Colors.blue[500],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("cheese"),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new CupertinoTabScaffold(
          tabBar: new CupertinoTabBar(
            items: <BottomNavigationBarItem> [
              MessageList.barItem,
              CameraApp.barItem,
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return new MessageList(index: index,title: "pants",list: list,);
            } else if (index == 1) {
              return new CameraApp();
            }
          },
        )
      ),
    );
  }
}