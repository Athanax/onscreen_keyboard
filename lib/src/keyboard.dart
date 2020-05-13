import 'package:flutter/material.dart';
import 'package:onscreen_keyboard/src/button.dart';
import 'package:onscreen_keyboard/src/labels.dart';

///
class OnscreenKeyboard extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final Color borderColor;
  final Color backgroundColor;
  final Color buttonColor;
  final Color focusColor;
  final double height;
  final double width;
  OnscreenKeyboard({
    this.height,
    this.width,
    this.onChanged,
    this.backgroundColor,
    this.focusColor,
    this.borderColor,
    this.buttonColor,
  })  : assert(height != null,
            'height of the widget must be provided in the button widget'),
        assert(width != null,
            'width of the widget label must be provided in the button widget');
  @override
  _OnscreenKeyboardState createState() => _OnscreenKeyboardState();
}

class _OnscreenKeyboardState extends State<OnscreenKeyboard> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: widget.backgroundColor != null
              ? widget.backgroundColor
              : Colors.transparent,
          height: widget.height != null ? widget.height : null,
          width: widget.width != null ? widget.width : null,
          child: GridView.builder(
              itemCount: labels.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
              ),
              itemBuilder: (context, index) {
                return new Button(
                  focusColor: widget.focusColor ?? widget.focusColor,
                  borderColor: widget.borderColor ?? widget.borderColor,
                  buttonColor: widget.buttonColor ?? widget.buttonColor,
                  label: new Text(
                    labels[index],
                    style: new TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    text = text + labels[index];
                    setState(() {});
                    widget.onChanged(text);
                  },
                );
              }),
        ),
        Container(
          width: widget.width != null ? widget.width : null,
          color: widget.backgroundColor != null
              ? widget.backgroundColor
              : Colors.transparent,
          child: Center(
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: new Button(
                    focusColor: widget.focusColor ?? widget.focusColor,
                    borderColor: widget.borderColor ?? widget.borderColor,
                    buttonColor: widget.buttonColor ?? widget.buttonColor,
                    onPressed: () {
                      text = '';
                      setState(() {});
                      widget.onChanged(text);
                    },
                    label: new Text(
                      'CLEAR',
                      style: new TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: new Button(
                    focusColor: widget.focusColor ?? widget.focusColor,
                    borderColor: widget.borderColor ?? widget.borderColor,
                    buttonColor: widget.buttonColor ?? widget.buttonColor,
                    onPressed: () {
                      text = text + ' ';
                      setState(() {});
                      widget.onChanged(text);
                    },
                    label: new Icon(
                      Icons.space_bar,
                      size: 35,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: new Button(
                    focusColor: widget.focusColor ?? widget.focusColor,
                    borderColor: widget.borderColor ?? widget.borderColor,
                    buttonColor: widget.buttonColor ?? widget.buttonColor,
                    onPressed: () {
                      if (text.length > 0) {
                        text = text.substring(0, text.length - 1);
                      }
                      setState(() {});
                      widget.onChanged(text);
                    },
                    label: new Icon(Icons.backspace, size: 20,),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
