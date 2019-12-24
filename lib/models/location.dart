import 'package:geolocator/geolocator.dart';

class Location{
  final double longitude;
  final double latitude;

  Location({this.longitude, this.latitude});

  factory Location.fromPosition(Position position){
    return Location(
      latitude: position.latitude,
      longitude: position.longitude
    );
  }


 
}