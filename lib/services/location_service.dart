import 'package:geolocator/geolocator.dart';
import 'package:mobilsharelocation/locator.dart';
import 'package:mobilsharelocation/models/location.dart';
import 'package:mobilsharelocation/services/location_base.dart';

class LocationService implements LocationBase {
  Location _location = locator<Location>();
  @override
  Future<Location> getLocation() async{
    
    Position _position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _location.latitude = _position.latitude;
    _location.longitude = _position.longitude;
    return _location;
  }
}
