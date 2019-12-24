import 'package:flutter/material.dart';

import 'package:mobilsharelocation/screens/home_page.dart';
import 'package:mobilsharelocation/viewmodels/location_viewmodel.dart';
import 'package:provider/provider.dart';

import 'google_map.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationViewModel>(
      builder: (context, viewmodel, child) {
        if (viewmodel.state == ViewState.Idle && viewmodel.location == null) {
          return HomePage();
        }
        if(viewmodel.state==ViewState.Idle && viewmodel.location!=null){
          return GoogleMapWidget();
        }
        else {
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        }
      },
    );
  }
}
