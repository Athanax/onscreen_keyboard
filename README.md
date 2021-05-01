# onscreen_keyboard

## Introduction

A simple package for dispaying virtual keyboards on android TV. It can also be used on mobile devices. The package fully responds to D-Pad controls.

## Installation

Add the dependency to your pubspec.yaml file.

``` yaml
dependencies:
    flutter:
        sdk: flutter
    onscreen_keyboard:

```

## Import class

``` dart

import 'package:onscreen_keyboard/onscreen_keyboard.dart';

```

## How to implement in code


The onChanged is a Signature for callbacks that returns a string that is already typed, in is called whenever the value changes.

``` dart

new OnscreenKeyboard(
  value: 'atha',
  backgroundColor: Colors.blue,
  buttonColor: Colors.amber,
  focusColor: Colors.red,
  onChanged: (txt) {
    setState(() {
      text = txt;
    });
  },
),

```

## Example

``` dart

import 'package:flutter/material.dart';
import 'package:onscreen_keyboard/onscreen_keyboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Text(
                text,
                style: new TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              child: Container(
                width: 300,
                child: new OnscreenKeyboard(
                  value: 'atha',
                  backgroundColor: Colors.blue,
                  buttonColor: Colors.amber,
                  focusColor: Colors.red,
                  onChanged: (txt) {
                    setState(() {
                      text = txt;
                    });
                  },
                ),
              ),
            ),
            //
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


```


## Getting started with flutter?

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs)
