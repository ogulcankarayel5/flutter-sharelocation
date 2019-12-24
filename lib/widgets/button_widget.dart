import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget   {
  final Widget buttonText;
  final Color buttonColor;
 
  final double height;
  final Widget buttonIcon;
  final VoidCallback onPressed;
  final double radius;
  final double width;

  const CustomButton(
      {Key key,
      @required this.buttonText,
      this.buttonColor: Colors.black,
      this.width,
      this.height:45.0,
      this.buttonIcon,
      @required this.onPressed,
      this.radius: 16})
      : assert(buttonText != null, onPressed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: SizedBox(
        height:height ,
        width: width,
              child: RaisedButton(
          onPressed: onPressed,
          child: buttonText,
          color: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }
}
