import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobilsharelocation/locator.dart';
import 'package:mobilsharelocation/models/adress.dart';
import 'package:mobilsharelocation/models/location.dart';
import 'package:mobilsharelocation/repository/location_repository.dart';
import 'package:mobilsharelocation/services/location_base.dart';
import 'package:share/share.dart';

enum ViewState { Idle, Busy }

class LocationViewModel with ChangeNotifier implements LocationBase {
  ViewState _state = ViewState.Idle;

  Location _location;
  ExactAddress _exactAdress;

  LocationRepository _locationRepository = locator<LocationRepository>();

  Location get location => _location;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }



  Set<Marker> createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("Your location"),
        position: LatLng(location.latitude ?? 37.42796133580664,
            location.longitude ?? -122.085749655962),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: "Home",snippet: _exactAdress.toString()),
      ),
    ].toSet();
  }

  

  Future<void> shareLocation(double latitude,double longitude){
    
     Share.share(('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude'),subject: 'My location');
  }
  @override
  Future<Location> getLocation() async {
    try {
      state = ViewState.Busy;

      _location = await _locationRepository.getLocation();
      await getAdress(_location.latitude, _location.longitude);
      return _location;
    } finally {
      state = ViewState.Idle;
    }
  }

  getAdress(double latitude,double longitude) async{
    _exactAdress= await _locationRepository.getAdress(latitude,longitude);
    return _exactAdress;
  }

 
}
