import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:async';
import 'package:camera/camera.dart';

class CameraShow extends StatefulWidget {
  @override
  _CameraAppState createState() => new _CameraAppState();
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class _CameraAppState extends State<CameraShow> {
  CameraController controller;
  bool _isReady = false;
  List<CameraDescription> cameras;

  Future<Null> initializeCameras() async {
  // Fetch the available cameras before initializing the app.
       try {
      // initialize cameras.
      cameras = await availableCameras();
      // initialize camera controllers.
      controller = new CameraController(cameras[0], ResolutionPreset.medium);
      await controller.initialize();
    } on CameraException catch (e) {
      logError(e.code, e.description);
    }
    // if (!isMounted) return;
    setState(() {
      _isReady = true;
    });
  }

  @override
  void initState() {
    super.initState();

    this.initializeCameras();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) return new Container();

    if (!controller.value.isInitialized) {
      return new Container();
    }
    return new AspectRatio(
        aspectRatio:
        controller.value.aspectRatio,
        child: new CameraPreview(controller));
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

    // return new CameraShow();
  }
}
