import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Widget label;
  ButtonWidget({this.label})
      : assert(label != null, 'label must be provided in the button widget');

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: label,
    );
  }
}
