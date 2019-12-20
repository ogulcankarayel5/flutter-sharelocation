import 'package:flutter/material.dart';
import 'package:mobilsharelocation/screens/home_page.dart';
import 'package:mobilsharelocation/utilities/constant.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    return SplashScreen(
     
      seconds: 2,
      navigateAfterSeconds: HomePage(),
      title: Text(
        'Share Your Location',
        style: kTitleTextStyle,
      ),
      image: Image.asset(
          "assets/images/location-clipart-location-pointer-5-removebg-preview.png"),
      backgroundColor: Colors.white,
    
      photoSize: height * 0.10,
      onClick: () => print("Flutter Egypt"),
     
    );
    
  }
}
