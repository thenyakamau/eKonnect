import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';

import '../errors/Exceptions.dart';

abstract class UserLocation {
  Future<String> getCounty();
  Future<Coordinates> getUserLocation();
  Future<bool> serviceEnabled();
}

class UserLocationImpl implements UserLocation {
  LocationData myLocation;
  String error;

  final Location location;

  UserLocationImpl({@required this.location});

  Future<LocationData> _getPermissions() async {
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        // error = 'please grant permission';
        // print(error);
        throw PermissionDeniedException();
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        // error = 'permission denied- please enable it from app settings';
        // print(error);
        throw PermissionNeveAskedException();
      }
      myLocation = null;
    }

    return myLocation;
  }

  @override
  Future<String> getCounty() async {
    // currentLocation = myLocation;
    myLocation = await _getPermissions();

    final coordinates =
        new Coordinates(myLocation.latitude, myLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;

    return first.adminArea;
  }

  @override
  Future<Coordinates> getUserLocation() async {
    myLocation = await _getPermissions();

    final coordinates =
        new Coordinates(myLocation.latitude, myLocation.longitude);
    return coordinates;
  }

  @override
  Future<bool> serviceEnabled() async {
    var _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
}
