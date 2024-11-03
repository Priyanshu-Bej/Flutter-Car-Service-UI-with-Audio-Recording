import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter_car_service_ui/profile/profile.dart';
import 'package:flutter_car_service_ui/views/homepage/homepage.dart';

import '../homepage/viewallJobs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Initial index for the first tab

  // Updated list of widget options to include actual pages
  static final List<Widget> _widgetOptions = <Widget>[
    const Homepage(),
    const AllJobsCards(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Display the selected widget based on _selectedIndex
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: FlashyTabBar(
        height: 55,
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: _onItemTapped,
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.list_alt_rounded),
            title: const Text('All Jobs Card'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Profile'),
          ),
        ],
      ),
    );
  }
}
