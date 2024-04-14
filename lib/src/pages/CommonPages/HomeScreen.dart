// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/login/1',
                );
              },
              child: const Text('U Butao'),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  color: Colors.black,
                ),
                Container(
                  height: 150,
                  width: 150,
                  color: Colors.blue,
                )
              ],
            )
          ],
        )));
  }
}
