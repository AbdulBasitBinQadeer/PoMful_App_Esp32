import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class DeviceSelectionPage extends StatefulWidget {
  @override
  _DeviceSelectionPageState createState() => _DeviceSelectionPageState();
}

class _DeviceSelectionPageState extends State<DeviceSelectionPage> {
  List<BluetoothDevice> devices = [];
  BluetoothDevice? connectedDevice;
  bool isConnecting = false;
  StreamSubscription<BluetoothConnectionState>? subscription;


  @override
  void initState() {
    super.initState();
    _checkPermissionsAndScan();
  }

  Future<void> _checkPermissionsAndScan() async {
    if (await Permission.bluetooth.isGranted && await Permission.locationWhenInUse.isGranted) {
      scanForDevices();
    } else {
      await _requestPermissions();
    }
  }

  Future<void> _requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.locationWhenInUse,
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect
    ].request();

    if (statuses[Permission.locationWhenInUse] == PermissionStatus.granted &&
        statuses[Permission.bluetooth] == PermissionStatus.granted &&
        statuses[Permission.bluetoothScan] == PermissionStatus.granted &&
        statuses[Permission.bluetoothConnect] == PermissionStatus.granted) {
      scanForDevices();
    } else {
      print('Bluetooth or Location permissions are not granted.');
    }
  }

  void scanForDevices() {
    try {
      FlutterBluePlus.startScan(timeout: const Duration(seconds: 30));
      print("Started scanning for devices...");

      FlutterBluePlus.scanResults.listen((results) {
        print("Scan results received: ${results.length}");
        for (ScanResult result in results) {
          // Try getting the device name from advertisementData
          String deviceName = result.advertisementData.advName.isNotEmpty
              ? result.advertisementData.advName
              : result.device.platformName.isNotEmpty
              ? result.device.platformName
              : "Unknown Device";

          // Filter for ESP32 devices or add any other filter based on your requirement
          if (result.device.platformName.contains('ESP32')) {
            print("Found ESP32 device: $deviceName, id: ${result.device.remoteId}");

            if (!devices.any((device) => device.remoteId == result.device.remoteId)) {
              setState(() {
                devices.add(result.device);
              });
            }
          } else if (deviceName != "Unknown Device") {
            // Add other devices to the list as well if their names are found
            if (!devices.any((device) => device.remoteId == result.device.remoteId)) {
              setState(() {
                devices.add(result.device);
              });
            }
          }
        }
      }, onError: (error) {
        print("Scan error: $error");
      });
    } catch (e) {
      print("Error starting scan: $e");
    }
  }


  Future<void> connectToDevice(BluetoothDevice device) async {
    setState(() {
      isConnecting = true;
    });

    try {
      await device.connect();
      subscription = device.connectionState.listen((state) {
        if (state == BluetoothConnectionState.disconnected) {
          print("Disconnected from ${device.advName}");
          _onDeviceDisconnected(device);
        }
      }) as StreamSubscription<BluetoothConnectionState>?;

      setState(() {
        connectedDevice = device;
        isConnecting = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DeviceSuccessPage(device: device),
        ),
      );
    } catch (e) {
      if (e.toString().contains('133')) {
        print("Connection failed with status 133, retrying...");
        await _retryConnection(device);
      } else {
        print("Error connecting to device: $e");
        setState(() {
          isConnecting = false;
        });
        _showConnectionErrorDialog(e.toString());
      }
    }
  }

  Future<void> _retryConnection(BluetoothDevice device) async {
    await device.disconnect();
    await Future.delayed(Duration(seconds: 2));

    try {
      await connectToDevice(device);
    } catch (e) {
      print("Retrying connection failed: $e");
      _showConnectionErrorDialog("Retry failed: $e");
    }
  }

  void _onDeviceDisconnected(BluetoothDevice device) {
    setState(() {
      connectedDevice = null;
    });
    print("Device ${device.advName} disconnected.");
  }

  void _showConnectionErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Connection Error"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connect to your device')),
      body: Column(
        children: [
          isConnecting
              ? Center(child: CircularProgressIndicator())
              : devices.isEmpty
              ? Center(child: Text('No devices found.'))
              : Expanded(
            child: ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(devices[index].advName.isNotEmpty
                      ? devices[index].advName
                      : 'Unknown Device'),
                  subtitle: Text(devices[index].id.toString()),
                  onTap: () {
                    connectToDevice(devices[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DeviceSuccessPage extends StatelessWidget {
  final BluetoothDevice device;

  const DeviceSuccessPage({Key? key, required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connected!')),
      body: Center(
        child: Text('Successfully connected to ${device.advName}.'),
      ),
    );
  }
}
