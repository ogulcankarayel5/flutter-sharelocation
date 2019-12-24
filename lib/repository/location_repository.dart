import 'package:mobilsharelocation/locator.dart';
import 'package:mobilsharelocation/models/adress.dart';
import 'package:mobilsharelocation/models/location.dart';
import 'package:mobilsharelocation/services/location_base.dart';
import 'package:mobilsharelocation/services/location_service.dart';

enum AppMode { DEBUG, RELEASE }

class LocationRepository implements LocationBase {
  AppMode _appMode = AppMode.RELEASE;

  LocationService _locationService = locator<LocationService>();

  @override
  Future<Location> getLocation() async {
    if (_appMode == AppMode.RELEASE) {
      Location _location = await _locationService.getLocation();

      return _location;
    } else {
      return null;
    }
  }

  Future<ExactAddress> getAdress(double latitude, double longitude) async {
    if (_appMode == AppMode.RELEASE) {
      ExactAddress _exactAddress =
          await _locationService.getAdress(latitude, longitude);
      return _exactAddress;
    } else {
      return null;
    }
  }
}
