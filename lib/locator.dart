import 'package:get_it/get_it.dart';
import 'package:mobilsharelocation/models/location.dart';
import 'package:mobilsharelocation/repository/location_repository.dart';
import 'package:mobilsharelocation/services/location_service.dart';

GetIt locator=GetIt.instance;

void setupLocator(){

  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => LocationRepository());
  locator.registerFactory(() => Location());
}