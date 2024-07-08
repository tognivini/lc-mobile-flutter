// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:lc_mobile_flutter/src/service/repositories/LaundryRepository.dart';
import 'package:lc_mobile_flutter/src/service/repositories/ScheduleRepository.dart';
import 'dart:async';

import 'package:localstore/localstore.dart';

List listLaundry = [
  {'label': 'Selecione uma lavaderia', 'value': '0'}
];
List listMachines = [
  {'label': 'Selecione uma Máquina de lavar', 'value': '0'}
];

List listHour = [
  {'label': 'Selecione um horário', 'value': '0'}
];

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key, String? name});

  @override
  State<ScheduleScreen> createState() => _ScheduleState();
}

class _ScheduleState extends State<ScheduleScreen> {
  var finaldate;

  late List<DropdownMenuItem<String>> dropdownMenuLaundryOptions;
  late List<DropdownMenuItem<String>> dropdownMenuMachineOptions;
  late List<DropdownMenuItem<String>> dropdownMenuHoursOptions;

  onLoadUserInfo() async {
    final db = Localstore.instance;
    final localStorageData =
        await db.collection('storageUser').doc('storageUser').get();

    return localStorageData;
  }

  loadLists(localStorageData) async {
    onLoadLaundry(localStorageData);
    onLoadMachines(localStorageData);
    onLoadHours(localStorageData);
  }

  onLoadLaundry(localStorageData) async {
    print('---LoadLaundry---');
    var payload = {};
    payload["token"] = localStorageData['token'];

    final allLaundry = await LaundryRepository().getAllLaundry(payload);
    if (allLaundry != null) {
      listLaundry.length = 0;
      listLaundry.add({'label': 'Selecione uma lavaderia', 'value': '0'});

      for (var i = 0; i < allLaundry.length; i++) {
        var arrLaundry = {};
        arrLaundry["label"] = allLaundry[i]['name'];
        arrLaundry["value"] = allLaundry[i]['id'];
        listLaundry.add(arrLaundry);
      }
    }
  }

  onLoadMachines(localStorageData) async {
    if (dropdownLaundryValue != '0' && finaldate != null) {
      print('---LoadMachines---');
      var payload = {};
      payload["token"] = localStorageData['token'];

      final allLaundry = await LaundryRepository().getAllLaundry(payload);
      listMachines.length = 0;
      listMachines
          .add({'label': 'Selecione uma máquina de lavar', 'value': '0'});

      for (var i = 0; i < allLaundry.length; i++) {
        if (allLaundry[i]['id'] == dropdownLaundryValue) {
          if (allLaundry[i]['washMachines'].length > 0) {
            var arrMarchine = allLaundry[i]['washMachines'];
            for (var j = 0; j < arrMarchine.length; j++) {
              var arrMachineOptions = {};
              var useNmb = arrMarchine[j]['number'];
              arrMachineOptions["label"] = 'Máquina $useNmb';
              arrMachineOptions["value"] = arrMarchine[j]['id'];
              listMachines.add(arrMachineOptions);
            }
          }
        }
      }
    }
  }

  onLoadHours(localStorageData) async {
    if (dropdownLaundryValue != '0' &&
        dropdownMachineValue != '0' &&
        finaldate != null) {
      print('---LoadHours---');
      var payload = {};
      payload["token"] = localStorageData['token'];
      payload["laundryId"] = dropdownLaundryValue;
      payload["washMachineId"] = dropdownMachineValue;
      payload["date"] = '${finaldate}T00:00:00.000-03:00';

      final allHours = await ScheduleRepository().getAvaliableHours(payload);

      listHour.length = 0;
      listHour.add({'label': 'Selecione um horário', 'value': '0'});

      for (var i = 0; i < allHours.length; i++) {
        var arrHourOptions = {};
        arrHourOptions["label"] = allHours[i];
        arrHourOptions["value"] = allHours[i];
        listHour.add(arrHourOptions);
      }
    }
  }

  handleSubmit() async {
    final db = Localstore.instance;
    final localStorageData =
        await db.collection('storageUser').doc('storageUser').get();

    if (dropdownLaundryValue != '0' &&
        dropdownMachineValue != '0' &&
        finaldate != null) {
      print('---CallSchedule---');

      var payload = {};
      payload["token"] = localStorageData?['token'];

      var laundry = {};
      laundry['id'] = dropdownLaundryValue;
      payload['laundry'] = laundry;

      var washMachine = {};
      washMachine['id'] = dropdownMachineValue;
      payload['washMachine'] = washMachine;

      payload["date"] = '${finaldate}T00:00:00.000-03:00';

      var endHour = dropdownHourValue;
      switch (dropdownHourValue) {
        case "08:00":
          endHour = "10:00";
          break;
        case "10:00":
          endHour = "12:00";
          break;
        case "14:00":
          endHour = "16:00";
          break;
        case "16:00":
          endHour = "18:00";
          break;
        case "18:00":
          endHour = "20:00";
          break;
        case "20:00":
          endHour = "22:00";
          break;
        case "22:00":
          endHour = "00:00";
          break;
        default:
          print('error');
      }

      //   const payload = {
      //   date: formattedTime,
      //   laundry: {
      //     id: selectedLaundry?.value,
      //   },
      //   washMachine: {
      //     id: selectedWashMachine?.value,
      //   },
      //   startHour: selectedHour,
      //   endHour: endHour,
      //   responsible: { id: responsible.id },
      //   client: { id: user?.userId },
      // };
    }
  }

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
  var dropdownLaundryValue = listLaundry[0]['value'];
  var dropdownMachineValue = listMachines[0]['value'];
  var dropdownHourValue = listHour[0]['value'];

  Future<DateTime?> getDate() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
  }

  @override
  Widget build(BuildContext context) {
    onLoadUserInfo().then((localStorageData) => {loadLists(localStorageData)});

    dropdownMenuLaundryOptions = listLaundry
        .map((item) => DropdownMenuItem<String>(
            value: item['value'], child: Text(item['label'])))
        .toList();

    dropdownMenuMachineOptions = listMachines
        .map((item) => DropdownMenuItem<String>(
            value: item['value'], child: Text(item['label'])))
        .toList();

    dropdownMenuHoursOptions = listHour
        .map((item) => DropdownMenuItem<String>(
            value: item['value'], child: Text(item['label'])))
        .toList();

    var blockSchedule = dropdownLaundryValue != '0' &&
        dropdownMachineValue != '0' &&
        dropdownHourValue != '0' &&
        finaldate != null;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Agendamento'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
                child: Text('Agendamento',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 10, bottom: 0, left: 10),
                  child: Container(
                      padding: const EdgeInsets.only(
                          top: 0, right: 10, bottom: 0, left: 10),
                      height: 65,
                      width: 280,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: DropdownButtonFormField<String>(
                          value: dropdownLaundryValue,
                          icon: const Icon(Icons.launch),
                          elevation: 16,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 29, 28, 31)),
                          padding: const EdgeInsets.only(
                              top: 0, right: 0, bottom: 0, left: 0),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurpleAccent, width: 2.4),
                            ),
                          ),
                          onChanged: (value) {
                            if (value == '0') {
                              print('limpa os outros');
                              //https://medium.com/@bigface00/flutter-tips-dynamically-changing-dropdownbutton-contents-with-another-dropdown-button-475dfae1fd58
                            }
                            print(value);
                            setState(() {
                              dropdownLaundryValue = value;
                            });
                          },
                          items: dropdownMenuLaundryOptions))),
              //calendar
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, right: 30, bottom: 0, left: 30),
                child: Container(
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
                          child: Container(
                        child: finaldate == null
                            ? const Text(
                                "Selecione a data",
                                textScaleFactor: 1.0,
                              )
                            : Text(
                                "$finaldate",
                                textScaleFactor: 1.0,
                              ),
                      )
                          // ),
                          ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.calendar_month, size: 26),
                          onPressed: () {
                            callDatePicker();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 10, bottom: 0, left: 10),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 0, right: 10, bottom: 0, left: 10),
                    height: 65,
                    width: 280,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: DropdownButtonFormField<String>(
                        value: dropdownMachineValue,
                        icon: const Icon(Icons.local_laundry_service),
                        elevation: 16,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 29, 28, 31)),
                        padding: const EdgeInsets.only(
                            top: 0, right: 0, bottom: 0, left: 0),
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 2.4),
                          ),
                        ),
                        onChanged: (value) {
                          if (value == '0') {
                            print('limpa hour');
                          }
                          setState(() {
                            dropdownMachineValue = value;
                          });
                        },
                        items: dropdownMenuMachineOptions),
                  )),

              //hour
              Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 10, bottom: 0, left: 10),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 0, right: 10, bottom: 0, left: 10),
                    height: 65,
                    width: 280,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: DropdownButtonFormField<String>(
                        value: dropdownHourValue,
                        icon: const Icon(Icons.access_time),
                        elevation: 16,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 29, 28, 31)),
                        padding: const EdgeInsets.only(
                            top: 0, right: 0, bottom: 0, left: 0),
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 2.4),
                          ),
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownHourValue = value!;
                          });
                        },
                        items: dropdownMenuHoursOptions),
                  )),

              Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        color: !blockSchedule ? Colors.grey : Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: !blockSchedule
                        ? TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: null,
                            child: const Text('Agendar'),
                          )
                        : TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {
                              handleSubmit();
                            },
                            child: const Text('Agendar'),
                          ),
                  )),
            ],
          ),
        ));
  }
}
