// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member, deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:async';

const List<String> list = <String>[
  'Lavanderia 1 - CEU 1',
  'Lavanderia 2 - CEU 1',
  'Lavanderia 1 - CEU 2'
];

const List<String> listHour = <String>[
  '08:00',
  '10:00',
  '10:00',
  '10:00',
  '14:00',
  '16:00',
  '18:00',
  '20:00',
  '22:00',
];

const List<String> listMachines = <String>[
  'Maquina 1',
  'Maquina 2',
  'Maquina 3',
  'Maquina 4',
];
// import 'package:lc_mobile_flutter/src/components/SelectInput/SelectInput';

// ignore: must_be_immutable
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key, String? name});

  // String id;

  @override
  State<ScheduleScreen> createState() => _ScheduleState();
}

class _ScheduleState extends State<ScheduleScreen> {
  var finaldate;

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 10));

  void callDatePicker() async {
    var order = await getDate();
    setState(() {
      finaldate = order;
    });
  }

  // ScheduleScreen({
  //   super.key,
  //   required this.id,
  // });
  TextEditingController nameController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String dropdownValue = list.first;
  String dropdownHourValue = listHour.first;
  String dropdownMachineValue = listMachines.first;

  // setState(
  // nomeController.text
  // )

  Future<DateTime?> getDate() {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      // builder: (BuildContext context, Widget child) {
      //   return Theme(
      //     data: ThemeData.light(),
      //     child: child,
      //   );
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Schedule'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Text('Agendamento',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 5, left: 20, right: 20, bottom: 0),
                  child: Container(
                    height: 65,
                    width: 280,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.launch),
                      elevation: 16,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 29, 28, 31)),
                      padding: const EdgeInsets.only(top: 0, bottom: 0),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Container(
                    height: 30,
                    width: 100,
                    // decoration: BoxDecoration(
                    //     color: Colors.blue,
                    //     borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        finaldate == null
                            ? const Text(
                                "",
                                textScaleFactor: 1.0,
                              )
                            : Text(
                                "$finaldate",
                                textScaleFactor: 1.0,
                              ),
                      ],
                    )),
              ),
              //calendar
              Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        callDatePicker();
                      },
                      child: const Text('DatePicker'),
                    ),
                  )),
              //hour
              Padding(
                  padding: const EdgeInsets.only(
                      top: 5, left: 20, right: 20, bottom: 0),
                  child: Container(
                    height: 65,
                    width: 280,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton<String>(
                      value: dropdownHourValue,
                      icon: const Icon(Icons.access_time),
                      elevation: 16,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 29, 28, 31)),
                      padding: const EdgeInsets.only(top: 0, bottom: 0),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownHourValue = value!;
                        });
                      },
                      items: listHour
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 5, left: 20, right: 20, bottom: 0),
                  child: Container(
                    height: 65,
                    width: 280,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton<String>(
                      value: dropdownMachineValue,
                      icon: const Icon(Icons.local_laundry_service),
                      elevation: 16,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 29, 28, 31)),
                      padding: const EdgeInsets.only(top: 0, bottom: 0),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownMachineValue = value!;
                        });
                      },
                      items: listMachines
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        print(nameController.text);
                      },
                      child: const Text('Agendar'),
                    ),
                  )),
            ],
          ),
        ));
  }
}
