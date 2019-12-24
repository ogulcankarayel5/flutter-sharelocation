import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {

  final Widget content;
  final Widget button;
  final Widget text;

  const CustomColumn({Key key, this.content, this.button,this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        text,
        content,
        button
        
      ],
    );
  }
}