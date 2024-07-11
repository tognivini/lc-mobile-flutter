// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member
import 'package:flutter/material.dart';
import 'package:lc_mobile_flutter/src/components/NextSchedulesFutureBuilder/NextSchedulesFutureBuilder.dart';

// ignore: must_be_immutable
class NextSchedulesScreen extends StatefulWidget {
  const NextSchedulesScreen({super.key, String? name});

  @override
  State<NextSchedulesScreen> createState() => _NextSchedulesState();
}

class _NextSchedulesState extends State<NextSchedulesScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(top: 60, bottom: 20),
            child: Text('Próximo Agendamentos',
                style: TextStyle(color: Colors.black, fontSize: 18)),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              height: 350,
              width: 300,
              child: const NextSchedulesFutureBuilder()),
        ]),
      ),
    );
  }
}
