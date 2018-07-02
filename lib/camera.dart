import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:barcode_scan/barcode_scan.dart';

import 'dart:async';

class CameraShow extends StatefulWidget {
  @override
  _CameraShow createState() => new _CameraShow();
}

class _CameraShow extends State<CameraShow> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new MaterialButton(
                      onPressed: scan, child: new Text("Scan")),
                  padding: const EdgeInsets.all(8.0),
                ),
                new Text(barcode),
              ],
            ),
          );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}

class CameraApp extends StatelessWidget {
  static const BottomNavigationBarItem barItem  = BottomNavigationBarItem(
                  icon: const Icon(CupertinoIcons.home),
                  title: const Text('Camera'),
                );
  @override
  Widget build(BuildContext context) {
    return new CupertinoTabView(
      builder: (BuildContext context) {
        return new CupertinoPageScaffold(
          child: new Center(
            child: new CameraShow()
          ),
        );
      },
    );
  }
}
