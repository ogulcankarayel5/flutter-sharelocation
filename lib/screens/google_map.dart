import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mobilsharelocation/viewmodels/location_viewmodel.dart';
import 'package:mobilsharelocation/widgets/platform_alert_widget.dart';
import 'package:provider/provider.dart';

class GoogleMapWidget extends StatefulWidget {
  static final String id='googlemap_screen';
  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final _locationViewModel = Provider.of<LocationViewModel>(context);

    return WillPopScope(
      onWillPop: () async {
        await _locationViewModel.setNullToLocation();
        Navigator.pop(context,true);
        
      },
          child: Scaffold(
        body: GoogleMap(
                markers: _locationViewModel.createMarker(),
                mapType: MapType.hybrid,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      _locationViewModel.location.latitude ?? 37.42796133580664,
                      _locationViewModel.location.longitude ?? -122.085749655962),
                  zoom: 14.4746,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
           
        floatingActionButton: FloatingActionButton.extended(
           onPressed: () async => await _shareLocation(
             _locationViewModel.location.latitude,
              _locationViewModel.location.longitude),
         
          label: Text('Share'),
          icon: Icon(Icons.send),
        ),
      ),
    );
  }

  _shareLocation(double latitude, double longitude) async {
    final _locationViewModel = Provider.of<LocationViewModel>(context);

    try {
      await _locationViewModel.shareLocation(latitude, longitude);
    } catch (e) {
      _showAlert(title: "Başarısız", content: e.toString());
    }
  }

  void _showAlert({String title, String content}) {
    PlatformAlertWidget(
      content: content,
      title: title,
      mainButtonText: "Tamam",
    ).show(context);
  }
}
