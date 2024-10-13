import 'package:flutter/material.dart';

import '../Auth/Create_Account/create_account.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const CreateAccountScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "PoM",
                    style: TextStyle(
                      letterSpacing: -6.0,
                      fontSize: 68,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "ful",
                    style: TextStyle(
                      letterSpacing: -3.0,
                      fontSize: 68,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF90c43c),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
          Positioned(
            bottom: 345,
            left: 0,
            right: 0,
            child: Text(
              "#homesafely",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// New HomeScreen class
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: const Center(
        child: Text(
          "Welcome to Home Screen!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
