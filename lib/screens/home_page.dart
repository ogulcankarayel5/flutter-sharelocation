import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mobilsharelocation/locator.dart';
import 'package:mobilsharelocation/models/location.dart';
import 'package:mobilsharelocation/screens/google_map.dart';
import 'package:mobilsharelocation/utilities/constant.dart';
import 'package:mobilsharelocation/viewmodels/location_viewmodel.dart';
import 'package:mobilsharelocation/widgets/button_widget.dart';
import 'package:mobilsharelocation/widgets/column.dart';
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
        title: Text(
          "YOUR LOCATION",
          style: kHomeTitleTextStyle,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: _locationUserViewModel.state == ViewState.Idle
          ? Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: OvalTopBorderClipper(),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(color: Colors.white),
                      child:CustomColumn(
                        text: Text("Location Service",style: TextStyle(fontSize: 30.0),),
                        icon: Icon(Icons.location_on,size: 50,),
                        button: buildCustomButton(),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  CustomButton buildCustomButton() {
    return CustomButton(
        buttonText: Text("FIND LOCATION", style: kCustomButtonTextStyle),
        onPressed: () => _getLocation(),
        buttonColor: Color(0xFFFF7A53));
  }


}
