import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MessageList extends StatelessWidget {
  const MessageList({this.title, this.index, this.list});

  static const BottomNavigationBarItem barItem  = BottomNavigationBarItem(
                    icon: const Icon(CupertinoIcons.home),
                    title: const Text('Message List'),
                  );

  final String title;
  final int index;
  final List<Widget> list;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new CupertinoTabView(
      builder: (BuildContext context) {
        return new CupertinoPageScaffold(
          navigationBar: new CupertinoNavigationBar(
            middle: new Text('$title Page 1 of tab $index'),
          ),
          child: new Center(
            child: new ListView(children: list,),
          ),
        );
      },
    );
  }
}
