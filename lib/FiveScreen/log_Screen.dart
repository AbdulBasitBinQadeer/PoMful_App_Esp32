import 'package:flutter/material.dart';


class LogScreen extends StatelessWidget {
  // Dummy log data
  final List<String> logs = List.generate(
    30, // Number of log entries
        (index) => 'Motion - 11:35 PM; 2/25/2024',
  );

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
              'Log',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 24),
            // Log list
            Expanded(
              child: ListView.builder(
                itemCount: logs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        Text(
                          logs[index],
                          style: TextStyle(fontSize: 19, color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(color: Colors.black,),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
