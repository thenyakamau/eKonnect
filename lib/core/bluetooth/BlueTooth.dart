import 'dart:async';

import 'package:eKonnect/features/data/datasources/EKonnectRemoteDataSource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BlueToothProvider with ChangeNotifier {
  bool isOn;
  String _data = 'Nobody found yet!';

  BlueToothProvider(
      {@required this.bluetoothSerial, @required this.remoteDataSource});
  String get data => _data;

  final FlutterBluetoothSerial bluetoothSerial;
  final EKonnectRemoteDataSource remoteDataSource;
  BluetoothConnection connection;

  void turnOn() async {
    isOn = await bluetoothSerial.isEnabled;
    notifyListeners();
  }

  Future<String> generateBluetoothAddress() async {
    return await bluetoothSerial.address;
  }

  Future<bool> searchForDevices() async {
    isOn = await bluetoothSerial.isEnabled;
    notifyListeners();
    String address = await bluetoothSerial.address;
    print("this is my address $address");

    if (!isOn) {
      return false;
    } else {
      bluetoothSerial.requestDiscoverable(1200).then((value) async {
        List<BluetoothDiscoveryResult> bluetoothDiscoveryResult =
            await bluetoothSerial.startDiscovery().toList();

        String address = await bluetoothSerial.address;
        var device;

        for (var i = 0; i < bluetoothDiscoveryResult.length; i++) {
          BluetoothDiscoveryResult result = bluetoothDiscoveryResult[i];
          if (result != device)
            print("the user address is ${result.device.address}");
          device = bluetoothDiscoveryResult[i];
        }

        // bluetoothDevices.map((device) async {
        //   bool isConnect = device.isConnected;
        //   if (!isConnect)
        //     try {
        //       BluetoothConnection connection =
        //           await BluetoothConnection.toAddress(device.address)
        //               .timeout(Duration(seconds: 20));
        //       print('Connected to the device');
        //       connection.input.listen((Uint8List data) {
        //         print('Data incoming: ${ascii.decode(data)}');
        //         connection.output.add(data); // Sending data

        //         if (ascii.decode(data).contains('!')) {
        //           connection.finish(); // Closing connection
        //           print('Disconnecting by local host');
        //         }
        //       }).onDone(() {
        //         print('Disconnected by remote request');
        //       });
        //       connection.output.add(utf8.encode(address));

        //       await connection.output.allSent;
        //     } catch (e) {
        //       print(e.toString());
        //     }
        // });
      });

      return true;
    }
  }
}
