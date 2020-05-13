# onscreen_keyboard

A new Flutter package project for android TV.

# Installation

Add the dependency to your pubspec.yaml file.

``` yaml
dependencies:
    flutter:
        sdk: flutter
    onscreen_keyboard:

```

# Import class

``` dart

import 'package:onscreen_keyboard/onscreen_keyboard.dart';

```

# How to implement in code

The height and width of the keyboard must be specified

The onChanged is a Signature for callbacks that returns a string that is already typed, in is called whenever the value changes.

``` dart

OnscreenKeyboard(
    backgroundColor: Colors.blue,
    buttonColor: Colors.amber,
    focusColor: Colors.red,
    onChanged: (txt) {
        setState(() {
        text = txt;
        });
    },
    height: 300,
    width: 300,
),

```

# Example

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
              child: new OnscreenKeyboard(
                backgroundColor: Colors.blue,
                buttonColor: Colors.amber,
                focusColor: Colors.red,
                onChanged: (txt) {
                  setState(() {
                    text = txt;
                  });
                },
                height: 300,
                width: 300,
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

![Demo screenshot!](/assets/screenshot.png "Demo screenshot")

## Getting started with flutter?

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs)
