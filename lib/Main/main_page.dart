
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../bluetooth.dart';
import '../wifi.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.locationWhenInUse,
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect
    ].request();

    if (statuses[Permission.locationWhenInUse] != PermissionStatus.granted) {
      _showPermissionDeniedDialog('Location');
    }

    if (statuses[Permission.bluetooth] != PermissionStatus.granted ||
        statuses[Permission.bluetoothScan] != PermissionStatus.granted ||
        statuses[Permission.bluetoothConnect] != PermissionStatus.granted) {
      _showPermissionDeniedDialog('Bluetooth');
    }
  }

  void _showPermissionDeniedDialog(String permission) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("$permission Permission Denied"),
          content: Text("Please enable $permission permissions to use this feature."),
          actions: [
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

  void navigateToBluetooth() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DeviceSelectionPage()),
    );
  }

  void navigateToWifi() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WifiConnectionPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "PoM",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              "ful",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF90c43c), // Updated color
              ),
            ),
          ],
        ),
        centerTitle: true, // Center the AppBar title
        elevation: 0, // Remove shadow for cleaner look

      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose a Connection Method',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 30), // Space between text and buttons
            ElevatedButton.icon(
              onPressed: navigateToBluetooth,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF90c43c),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: Icon(Icons.bluetooth, color: Colors.white),
              label: Text(
                'Connect to Bluetooth',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20), // Space between buttons
            ElevatedButton.icon(
              onPressed: navigateToWifi,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF90c43c),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: Icon(Icons.wifi, color: Colors.white),
              label: Text(
                'Connect to Wi-Fi',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}