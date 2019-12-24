import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:mobilsharelocation/screens/home_page.dart';
import 'package:mobilsharelocation/utilities/constant.dart';


class Splash extends StatelessWidget {
  static final String id ='splash_screen';
  @override
  Widget build(BuildContext context) {
    return AnimatedSplash(
     imagePath:"assets/images/location-clipart-location-pointer-5-removebg-preview.png",
     home: HomePage(),
     duration: 3000,
     type: AnimatedSplashType.StaticDuration,
     
   );
  }
}

/*
 final height=MediaQuery.of(context).size.height;
    return SplashScreen(
     
      seconds: 2,
      navigateAfterSeconds: HomePage(),
      title: Text(
        'Welcome To Sharloc',
        style: kTitleTextStyle,
      ),
      image: Image.asset(
          "assets/images/location-clipart-location-pointer-5-removebg-preview.png"),
      backgroundColor: Colors.white,
    
      photoSize: height * 0.15,
      
     
    );
 */
