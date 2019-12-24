import 'package:geolocator/geolocator.dart';

class ExactAddress{

 
  final String administrativeArea;
  final String thoroughfare;
  final String name;
  final String postalCode;
  final String country;

  ExactAddress({this.administrativeArea, this.thoroughfare, this.name, this.postalCode, this.country});

  factory ExactAddress.placeMarkToAddress(Placemark placeMark){
    return ExactAddress(
      administrativeArea:placeMark.administrativeArea??null,
      thoroughfare:placeMark.thoroughfare ?? null,
      name: placeMark.name ?? null,
      postalCode: placeMark.postalCode ?? null,
      country: placeMark.country ?? null,

    );
  }

  

  

  @override
  String toString() {
   
    return administrativeArea+","+thoroughfare+","+name+","+postalCode+","+country;
  }

  


}