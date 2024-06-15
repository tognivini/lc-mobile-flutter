// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:lc_mobile_flutter/src/pages/CommonPages/NextSchedulesScreen.dart';
import 'package:lc_mobile_flutter/src/pages/CommonPages/ProfileScreen.dart';
import 'package:lc_mobile_flutter/src/pages/CommonPages/ScheduleScreen.dart';

class NaviBottom extends StatefulWidget {
  @override
  _NaviBottomState createState() => _NaviBottomState();
}

class _NaviBottomState extends State<NaviBottom> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const ProfileScreen(),
    const ScheduleScreen(),
    const NextSchedulesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.blue,
        // selectedItemColor: Colors.black,
        // unselectedItemColor: Colors.white,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_calendar),
            label: 'Agendamento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Próximos agendamentos',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
