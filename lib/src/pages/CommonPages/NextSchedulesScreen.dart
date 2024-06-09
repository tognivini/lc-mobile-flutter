// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NextSchedulesScreen extends StatefulWidget {
  const NextSchedulesScreen({super.key, String? name});

  @override
  State<NextSchedulesScreen> createState() => _NextSchedulesState();
}

class _NextSchedulesState extends State<NextSchedulesScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Next Schedules'),
        ),
        body: const SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
            child: Text('Próximos agendamentos',
                style: TextStyle(color: Colors.black, fontSize: 26)),
          ),
          Text('Últimos agendamentos',
              style: TextStyle(color: Colors.black, fontSize: 26)),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 0, bottom: 20),
              // child: Text('Últimos agendamentos', style: TextStyle(color: Colors.black, fontSize: 26)),
              child: SingleChildScrollView(child: Column(children: []))),

          //end array
        ]))
        // )

        );
  }
}
