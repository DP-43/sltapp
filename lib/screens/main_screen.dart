import 'package:flutter/material.dart';
import 'package:slt/screens/home_page.dart';
import 'package:slt/screens/profile_page.dart';
import '../widgets/custom_bottom_nav.dart';
import '../screens/emergency_page.dart';
import '../screens/appoinment_page.dart';
import '../screens/message_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
     MessagePage(),
     AppoinmentPage(),
     ProfilePage(),
     EmergencyPage(),

  ];

  void _onTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }
     @override
     Widget build(BuildContext context) {
        return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: CustomBottomNav(
            currentIndex: _currentIndex,
            onTap: _onTap,
      ),
    );
  }
}