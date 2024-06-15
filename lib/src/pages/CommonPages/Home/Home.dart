// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../../routes.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _controller.currentTab,
          children: tabs,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
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
        currentIndex: _controller.currentTab,
        onTap: (int index) {
          setState(
            () {
              _controller.onItemTapped(index: index);
            },
          );
        },
      ),
    );
  }
}
