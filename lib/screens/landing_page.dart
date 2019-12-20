import 'package:flutter/material.dart';

import 'package:mobilsharelocation/screens/home_page.dart';
import 'package:mobilsharelocation/viewmodels/location_viewmodel.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {


  @override
  Widget build(BuildContext context) {
    final _locationViewModel=Provider.of<LocationViewModel>(context);
    if(_locationViewModel.state==ViewState.Idle){
     
        return HomePage();
     
      
    }
    else{
      return Scaffold(body: Center(child: CircularProgressIndicator(),));
    }
   
  }
}