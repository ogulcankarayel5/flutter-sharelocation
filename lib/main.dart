

import 'package:flutter/material.dart';

import 'package:mobilsharelocation/locator.dart';
import 'package:mobilsharelocation/screens/google_map.dart';
import 'package:mobilsharelocation/screens/home_page.dart';
import 'package:mobilsharelocation/screens/splash_screen.dart';

import 'package:mobilsharelocation/utilities/constant.dart';
import 'package:mobilsharelocation/viewmodels/location_viewmodel.dart';
import 'package:provider/provider.dart';


void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocationViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff66D7CD),
          primarySwatch: Colors.blue,
        ),
        initialRoute: Splash.id,
        routes:{
          HomePage.id:(context) => HomePage(),
          Splash.id:(context) => Splash(),
          GoogleMapWidget.id:(context)=>GoogleMapWidget(),
        },
       
      ),
    );
  }
}
