import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mobilsharelocation/utilities/constant.dart';
import 'package:mobilsharelocation/widgets/platform_widget.dart';

class PlatformAlertWidget extends PlatformWidget {
  final String title;
  final String content;
  final String mainButtonText;

  PlatformAlertWidget(
      {@required this.title,
      @required this.content,
      @required this.mainButtonText});

  Future<bool> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<bool>(
            context: context, builder: (context) => this)
        : await showDialog<bool>(
            context: context,
            builder: (context) => this,
            barrierDismissible: false);
  }

  @override
  Widget buildAndroidWidget(BuildContext context) {
  
    return AlertDialog(
      title: Text(title),
      content: Text(content,style: kPlatformAlerWidgetTitleStyle),
      actions: _dialogButtons(context),
    );
  }

  @override
  Widget buildIOSWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content,style: kPlatformAlerWidgetTitleStyle,),
      actions: _dialogButtons(context),
    );
  }

  List<Widget> _dialogButtons(BuildContext context) {
    final allButtons = <Widget>[];
    if (Platform.isIOS) {
      allButtons.add(CupertinoDialogAction(
        child: Text("Tamam",style: kPlatformAlerWidgetTextStyle,),
        onPressed: () {
          Navigator.of(context).pop(true);
        },
      ));
    } else {
      allButtons.add(
        FlatButton(
          child: Text("Tamam",
              style: kPlatformAlerWidgetTextStyle),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      );
    }

    return allButtons;
  }
}
