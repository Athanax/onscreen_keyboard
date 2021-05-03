import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Widget label;
  ButtonWidget({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: label,
    );
  }
}
