import 'package:geolocator/geolocator.dart';
import 'package:mobilsharelocation/locator.dart';
import 'package:mobilsharelocation/models/adress.dart';
import 'package:mobilsharelocation/models/location.dart';
import 'package:mobilsharelocation/services/location_base.dart';

class LocationService implements LocationBase {
  
  @override
  Future<Location> getLocation() async{
    
    Position _position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation).timeout(Duration(seconds: 10));
        
    return _locationFromPosition(_position);
    
    
  }

  Location _locationFromPosition(Position position){
    if(position!=null){
      return Location(latitude: position.latitude,longitude: position.longitude);
    }
    else{
      return null;
    }
  }

  Future<ExactAddress> getAdress(double latitude, double longitude) async{
    List<Placemark> _placeMark= await Geolocator().placemarkFromCoordinates(latitude, longitude);
    String _adress=_placeMark[0].name.toString() + "," + _placeMark[0].locality.toString()+","+_placeMark[0].administrativeArea+","+_placeMark[0].subAdministrativeArea+","+_placeMark[0].subLocality;
    return  _adressFromLocation(_adress);
  }

  ExactAddress _adressFromLocation(String address){
    if(address!=null){
      return ExactAddress(adress: address);
    }
    else{
      return null;
    }
  }

  



  
}
