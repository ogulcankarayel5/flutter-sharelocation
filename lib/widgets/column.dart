import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {

  final Widget icon;
  final Widget button;
  final Widget text;

  const CustomColumn({Key key, this.icon, this.button,this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        text,
        icon,
        button
        
      ],
    );
  }
}