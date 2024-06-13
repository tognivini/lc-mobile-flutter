// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member, deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:async';

const List<String> list = <String>[
  'Lavanderia 1 - CEU 1',
  'Lavanderia 2 - CEU 1',
  'Lavanderia 1 - CEU 2'
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
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text('Agendamento',
                    style: TextStyle(color: Colors.black, fontSize: 26)),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 20, right: 20, bottom: 0),
                  child: Container(
                    height: 80,
                    width: 280,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 29, 28, 31)),
                      padding: const EdgeInsets.only(top: 0, bottom: 20),
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
                  padding: const EdgeInsets.only(
                      top: 10, right: 20, bottom: 10, left: 20),
                  child: TextFormField(
                    obscureText: true,
                    controller: passController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                        hintText: 'Digite uma senha válida por favor'),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                    height: 50,
                    width: 100,
                    // decoration: BoxDecoration(
                    //     color: Colors.blue,
                    //     borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        finaldate == null
                            ? const Text(
                                "Use",
                                textScaleFactor: 1.0,
                              )
                            : Text(
                                "$finaldate",
                                textScaleFactor: 1.0,
                              ),
                        const SizedBox(height: 15),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 20, bottom: 20),
                        //   child: ElevatedButton(
                        //     child: Text('Button'),
                        //     style: ElevatedButton.styleFrom(
                        //         backgroundColor: Colors.blue),
                        //     onPressed: () {
                        //       print('____ping____');
                        //       // callDatePicker();
                        //     },
                        //   ),
                        // ),
                      ],
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: 50,
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
                      child: const Text('Agendar'),
                    ),
                  )),

              // Padding(
              //     padding: const EdgeInsets.only(top: 5),
              //     child: Container(
              //       height: 50,
              //       width: 100,
              //       decoration: BoxDecoration(
              //           color: Colors.blue,
              //           borderRadius: BorderRadius.circular(5)),
              //       child: TextButton(
              //         style: ButtonStyle(
              //           foregroundColor:
              //               MaterialStateProperty.all<Color>(Colors.white),
              //         ),
              //         onPressed: () {
              //           print(nameController.text);
              //           print(matriculaController.text);
              //           print(emailController.text);
              //           print(passController.text);
              //         },
              //         child: const Text('Agendar'),
              //       ),
              //     )),
            ],
          ),
        ));
  }
}
