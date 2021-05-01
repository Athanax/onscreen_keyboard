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
