import 'package:flutter/material.dart';



class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: const Row(
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
        ),
        centerTitle: true, // Center the AppBar title
        elevation: 0, // Remove shadow for cleaner look
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  'System Status',
                  style: TextStyle(fontSize: 26),
                ),
              ),
              SizedBox(height: 24),
              // System Status details
              buildStatusRow('System State:', 'Monitoring'),
              SizedBox(height: 10),
              buildStatusRow('Last Motion:', '11:35 PM; 2/25/2024'),
              SizedBox(height: 10),
              buildStatusRow('Last Device Heartbeat:', '11:35 PM; 2/25/2024'),
              SizedBox(height: 10),
              buildStatusRow('Subscription Start:', '11:35 PM; 2/25/2024'),
              SizedBox(height: 10),
              buildStatusRow('Subscription End:', '11:35 PM; 2/25/2024'),
              SizedBox(height: 10),
              buildStatusRow('Device ID:', '00:1B:44:11:3A:B7'),
              SizedBox(height: 10),
              buildStatusRow('Customer ID:', 'MarPar-A6C74D'),
              SizedBox(height: 10),
              buildStatusRow('Version', '1.0.0'),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build each row of system status information
  Widget buildStatusRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 5,),
        Text(
          value,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
