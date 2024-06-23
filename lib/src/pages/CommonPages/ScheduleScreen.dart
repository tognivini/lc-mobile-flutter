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

  bool isAlphanumeric(String input) {
    RegExp regExp = RegExp(r'^[a-zA-Z0-9]+$');
    return regExp.hasMatch(input);
  }

  void callDatePicker() async {
    var date = await getDate();

    String stringDate = date.toString();
    List<String> splitted = stringDate.split(" ");
    List<String> smaller = splitted.sublist(0, 1);
    String onlyDate = smaller.join(" ");
    setState(() {
      finaldate = onlyDate;
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  String dropdownValue = list.first;
  String dropdownHourValue = listHour.first;
  String dropdownMachineValue = listMachines.first;

  Future<DateTime?> getDate() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Agendamento'),
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
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
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
              //calendar
              Padding(
                padding:
                    EdgeInsets.only(top: 0, right: 20, bottom: 0, left: 20),
                child: Container(
                  // padding:
                  //     EdgeInsets.only(top: 0, right: 0, bottom: 5, left: 0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.deepPurpleAccent, width: 2.4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                            height: 30,
                            width: 60,
                            // decoration: BoxDecoration(
                            //     color: Colors.blue,
                            //     borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                finaldate == null
                                    ? const Text(
                                        "Selecione a data",
                                        textScaleFactor: 1.0,
                                      )
                                    : Text(
                                        "$finaldate",
                                        textScaleFactor: 1.0,
                                      ),
                              ],
                            )),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.calendar_month, size: 26),
                          onPressed: () {
                            callDatePicker();
                          },
                        ),
                        // icon: const Icon(Icons.local_laundry_service),
                      ),
                    ],
                  ),
                ),
              ),
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
