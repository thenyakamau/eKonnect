import '../../../core/location/GetUserLocation.dart';

class ServiceOn {
  final UserLocation userLocation;

  ServiceOn(this.userLocation);

  Future<bool> call() {
    return userLocation.serviceEnabled();
  }
}
