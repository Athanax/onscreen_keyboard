import 'package:flutter/material.dart';
import 'package:onscreen_keyboard/src/button_widget.dart';

class Button extends StatefulWidget {
  final Function onPressed;
  final Widget label;
  final Color borderColor;
  final Color buttonColor;
  final Color focusColor;
  final bool autofocus;
  Button({
    @required this.label,
    this.onPressed,
    this.autofocus,
    this.borderColor,
    this.focusColor,
    this.buttonColor,
  }) : assert(label != null, 'label must be provided in the button widget');

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  FocusNode _node;

  @override
  void initState() {
    _node = new FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      child: RawMaterialButton(
        autofocus: widget.autofocus ?? widget.autofocus,
        fillColor: widget.buttonColor ?? widget.buttonColor,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 20,
        focusColor: widget.focusColor ?? widget.focusColor,
        focusNode: _node,
        onPressed: () {
          widget.onPressed();
        },
        child: new ButtonWidget(
          label: widget.label,
        ),
      ),
    );
  }
}
