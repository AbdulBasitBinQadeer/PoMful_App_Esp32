import 'package:flutter/material.dart';
import 'package:warda/BottomNav/bottomNavBar.dart';
import 'package:wifi_iot/wifi_iot.dart';


class WifiConnectionPage extends StatefulWidget {
  @override
  _WifiConnectionPageState createState() => _WifiConnectionPageState();
}

class _WifiConnectionPageState extends State<WifiConnectionPage> {
  TextEditingController ssidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isConnecting = false;
  bool connectionSuccess = false;
  bool _obscureText = true;

  void connectToWiFi() async {
    setState(() {
      isConnecting = true;
      connectionSuccess = false; // Reset on new attempt
    });

    bool isConnected = await WiFiForIoTPlugin.connect(
      ssidController.text,
      password: passwordController.text,
      security: NetworkSecurity.WPA,
    );

    setState(() {
      isConnecting = false;
      connectionSuccess = isConnected;
    });

    if (isConnected) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuccessPage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Connection Failed'),
          content: Text('Failed to connect to Wi-Fi: ${ssidController.text}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Add SingleChildScrollView
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
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
                const SizedBox(height: 80),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ignore: prefer_const_constructors
                    Text(
                      'Connect to your home Wi-Fi.',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Wi-Fi Icon
                    InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> BottomNavbar()));
                      },
                      child: const Icon(
                        Icons.wifi,
                        size: 60,
                        color: Color(0xFF90c43c), // Updated color
                      ),
                    ),
                    const SizedBox(height: 30),
                    // SSID Input
                    // SSID Input
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: ssidController,
                        decoration: const InputDecoration(
                          labelText: 'SSID',
                          labelStyle: TextStyle(
                            color: Colors.grey, // Set label color
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF90c43c), // Focused border color
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey, // Default border color
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
// Password Input with Toggle Visibility
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Colors.grey, // Set label color
                          ),
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF90c43c), // Focused border color
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey, // Default border color
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        obscureText: _obscureText,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Connect Button
                    isConnecting
                        ? const CircularProgressIndicator()
                        : Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        width: double
                            .infinity, // Make the button stretch full width
                        child: ElevatedButton(
                          onPressed: connectToWiFi,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color(0xFF90c43c), // Updated color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding:
                            const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: const Text(
                            'Connect',
                            style: TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    if (connectionSuccess) ...[
                      const SizedBox(height: 20),
                      const Text(
                        'Connected!',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ] else if (!isConnecting &&
                        !connectionSuccess &&
                        ssidController.text.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      const Text(
                        'Connection Failed. Please try again.',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Success page after connection
class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      appBar: AppBar(
        title: const Text('Connected!'),
        backgroundColor: const Color(0xFF90c43c), // Set AppBar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Success message text
            const Text(
              'Connected to Wi-Fi and device successfully!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87, // Text color
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
                height: 20), // Add some space between text and button
            // Back to Start button
            ElevatedButton(
              onPressed: () {
                print('back to start');
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF90c43c), // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 30), // Button padding
              ),
              child: const Text(
                'Back to Start',
                style: TextStyle(
                    fontSize: 18, color: Colors.white), // Button text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
