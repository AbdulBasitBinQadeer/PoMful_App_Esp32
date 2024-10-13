import 'package:flutter/material.dart';
import 'package:warda/BottomNav/bottomNavBar.dart';
import 'package:warda/FiveScreen/log_Screen.dart';

class HouseScreen extends StatefulWidget {
  const HouseScreen({super.key});

  @override
  State<HouseScreen> createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> {
  // Variable to track the system state
  bool isMonitoring = true;

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
                color: Color(0xFF90c43c),
              ),
            ),
          ],
        ),
        centerTitle: true, // Center the AppBar title
        elevation: 0, // Remove shadow for cleaner look
      ),
      body: ListView(
        children:[ Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Home',
                style: TextStyle(fontSize: 26),
              ),
            ),
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      'System State: ',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    // Dynamically show "Monitoring" or "Paused" based on the isMonitoring variable
                    Text(
                      isMonitoring ? 'Monitoring' : 'Paused',
                      style: TextStyle(
                        fontSize: 24,
                        color: isMonitoring ? Color(0xFF90c43c) : Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                children: [
                  buildStatusRow('Last Motion:', '11:35 PM; 2/25/2024'),
                ],
              ),
            ),
            const SizedBox(height: 80), // Space before button
            Center(
              child: SizedBox(
                width: 300, // Make button full width
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LogScreen()));
                  },
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF90c43c),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    label: Text(
                      'Check In',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: SizedBox(
                width: 300, // Make button full width
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Update the system state when "Pause Monitoring" is clicked
                    setState(() {
                      isMonitoring = !isMonitoring;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF90c43c),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  label: Text(
                    isMonitoring ? 'Pause Monitoring' : 'Resume Monitoring',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),

                ),
              ),
            ),
          ],
        ),
      ]
      ),
    );
  }

  // Helper widget for building status rows
  Widget buildStatusRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 21),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 21),
        ),
      ],
    );
  }
}
