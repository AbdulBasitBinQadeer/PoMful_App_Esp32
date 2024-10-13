import 'package:flutter/material.dart';


class InformationScreen extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text(
             "Information",
             style: TextStyle(
               fontSize: 24,
               fontWeight: FontWeight.normal,
               color: Colors.black87,
             ),
           ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  Text(
                    "FAQ's",
                    style: TextStyle(fontSize: 24),
                  ),
                  Divider(color: Colors.black),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      // Navigate to FAQ screen
                    },
                    child: Text(
                      'How do I connect my device to Wifi?',
                      style: TextStyle(fontSize: 19, color: Colors.black),
                    ),
                  ),
                  Divider(color: Colors.black),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      // Navigate to FAQ screen
                    },
                    child: Text(
                      'How do I reset my device?',
                      style: TextStyle(fontSize: 19, color: Colors.black),
                    ),
                  ),
                  Divider(color: Colors.black),
                  SizedBox(height: 80),
                  Text(
                    'Support',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'info@pomful.com',
                    style: TextStyle(fontSize: 19, color: Colors.black),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'www.pomful.com/support',
                    style: TextStyle(fontSize: 19, color: Colors.black),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}