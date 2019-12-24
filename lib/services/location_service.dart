import 'package:geolocator/geolocator.dart';
import 'package:mobilsharelocation/locator.dart';
import 'package:mobilsharelocation/models/adress.dart';
import 'package:mobilsharelocation/models/location.dart';
import 'package:mobilsharelocation/services/location_base.dart';

class LocationService implements LocationBase {
  @override
  Future<Location> getLocation() async {
    Position _position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation)
        .timeout(Duration(seconds: 10));

    return Location.fromPosition(_position);
  }

  Future<ExactAddress> getAdress(double latitude, double longitude) async {
    List<Placemark> _placeMark =
        await Geolocator().placemarkFromCoordinates(latitude, longitude);
    var _placeAdress = _placeMark[0];

    return ExactAddress.placeMarkToAddress(_placeAdress);
  }
}
