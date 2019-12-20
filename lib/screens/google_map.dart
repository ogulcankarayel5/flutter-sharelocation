import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mobilsharelocation/viewmodels/location_viewmodel.dart';
import 'package:mobilsharelocation/widgets/platform_alert_widget.dart';
import 'package:provider/provider.dart';

class GoogleMapWidget extends StatefulWidget {
  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  Completer<GoogleMapController> _controller = Completer();

//TODO:ADD MARKER
  @override
  Widget build(BuildContext context) {
    final _locationViewModel = Provider.of<LocationViewModel>(context);

    return Scaffold(
      body: _locationViewModel.state == ViewState.Idle
          ? GoogleMap(
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
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>_shareLocation(_locationViewModel.location.latitude,_locationViewModel.location.longitude),
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final _locationViewModel = Provider.of<LocationViewModel>(context);
  //   try {
  //     final GoogleMapController controller = await _controller.future;
  //     await controller.animateCamera(CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: LatLng(_locationViewModel.location.latitude,
  //             _locationViewModel.location.longitude),
  //         zoom: 14.4746,
  //       ),
  //     ));
  //   } catch (e) {
  //     PlatformAlertWidget(
  //       title: "Başarısız",
  //       content: e.toString(),
  //       mainButtonText: "Tamam",
  //     ).show(context);
  //   }
  // }

  _shareLocation(double latitude,double longitude) async{
     final _locationViewModel = Provider.of<LocationViewModel>(context);
     
      await _locationViewModel.shareLocation(latitude, longitude);

  }
}
