import 'package:geolocator/geolocator.dart';
import 'package:mobilsharelocation/locator.dart';
import 'package:mobilsharelocation/models/adress.dart';
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

  Future<ExactAddress> getAdress(double latitude, double longitude) async{
    List<Placemark> _placeMark= await Geolocator().placemarkFromCoordinates(latitude, longitude);
    String _adress=_placeMark[0].name.toString() + "," + _placeMark[0].locality.toString()+","+_placeMark[0].administrativeArea;
    return ExactAddress(adress: _adress);
  }

  



  
}
