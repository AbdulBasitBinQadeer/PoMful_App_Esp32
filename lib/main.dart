import 'package:flutter/material.dart';
import 'package:warda/Splash/splash_screen.dart';


void main() {
  runApp(BluetoothWiFiApp());
}

class BluetoothWiFiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF90c43c),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      home:   const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

