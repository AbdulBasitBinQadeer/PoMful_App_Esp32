import 'package:flutter/material.dart';
import 'package:warda/FiveScreen/houseScreen.dart';
import 'package:warda/FiveScreen/information_screen.dart';
import 'package:warda/FiveScreen/log_Screen.dart';
import 'package:warda/FiveScreen/profile_Screen.dart';
import 'package:warda/FiveScreen/setting_Screen.dart';


class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  // Define the screens to navigate to
  final List<Widget> _screens = [
     const HouseScreen(),
    const ProfileScreen(),
     SettingScreen(),
     InformationScreen(),
     LogScreen(),
  ];

  // Update the selected index when an icon is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // To allow more than 3 icons
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,size: 40,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,size: 40,),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined,size: 40,),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info,size: 40,),
            label: 'Information',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined,size: 40,),
            label: 'Log',
          ),



        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen, // Color for selected icon
        unselectedItemColor: Colors.black, // Color for unselected icons
        onTap: _onItemTapped,
      ),
    );
  }
}

// Example screens for navigation
