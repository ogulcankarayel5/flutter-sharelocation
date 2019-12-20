import 'package:flutter/material.dart';
import 'package:mobilsharelocation/locator.dart';
import 'package:mobilsharelocation/models/location.dart';
import 'package:mobilsharelocation/screens/google_map.dart';
import 'package:mobilsharelocation/utilities/constant.dart';
import 'package:mobilsharelocation/viewmodels/location_viewmodel.dart';
import 'package:mobilsharelocation/widgets/button_widget.dart';
import 'package:mobilsharelocation/widgets/platform_alert_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Location _location = locator<Location>();

  _getLocation() async {
    final _locationUserViewModel = Provider.of<LocationViewModel>(context);
    try {
      _location = await _locationUserViewModel.getLocation();
      print(_location.latitude.toString());

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => GoogleMapWidget()));
    } catch (e) {
      PlatformAlertWidget(
        title: "Hata",
        content: "Lokasyon getirilemedi",
        mainButtonText: e.toString(),
      ).show(context);
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final _locationUserViewModel = Provider.of<LocationViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("YOUR LOCATION"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: _locationUserViewModel.state == ViewState.Idle
          ? Container(
              child: Center(
                child: buildColumn(),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Column buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Image.asset("assets/images/90514805-location-icon-map-pin-mark-gps-destination-symbol-removebg-preview.png"),
        Icon(
          Icons.location_on,
          size: 350,
          color: kLocationIconColor,
        ),
        CustomButton(
            buttonText: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("FIND LOCATION", style: kCustomButtonTextStyle),
                Icon(Icons.navigate_next)
              ],
            ),
            onPressed: () => _getLocation(),
            buttonColor: Colors.blueGrey),
      ],
    );
  }
}
