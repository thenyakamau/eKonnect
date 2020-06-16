import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BlueToothProvider with ChangeNotifier {
  bool isOn;
  String _data = 'Nobody found yet!';

  BlueToothProvider({
    @required this.bluetoothSerial,
  });
  String get data => _data;

  final FlutterBluetoothSerial bluetoothSerial;

  void turnOn() async {
    isOn = await bluetoothSerial.isEnabled;
    notifyListeners();
  }

  Future<bool> searchForDevices() async {
    isOn = await bluetoothSerial.isEnabled;
    notifyListeners();

    if (!isOn) {
      return false;
    } else {
      bluetoothSerial.requestDiscoverable(1200);

      bluetoothSerial.startDiscovery();
      final isDiscovering = await bluetoothSerial.isDiscovering;
      print(isDiscovering);
      final bluetoothDevices = await bluetoothSerial.getBondedDevices();

      String address = await bluetoothSerial.address;

      bluetoothDevices.map((device) {
        bool isConnect = device.isConnected;
        if (!isConnect)
          try {
            BluetoothConnection.toAddress(device.address)
                .timeout(Duration(seconds: 20));

            bluetoothSerial.write(address);
          } catch (e) {
            print(e.toString());
          }
      });

      return true;
    }
  }
}
