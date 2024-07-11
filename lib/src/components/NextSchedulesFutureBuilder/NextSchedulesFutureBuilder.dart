// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lc_mobile_flutter/src/service/repositories/ScheduleRepository.dart';
import 'package:lc_mobile_flutter/src/service/repositories/repository.dart';
import 'package:localstore/localstore.dart';

// ignore: must_be_immutable
class NextSchedulesFutureBuilder extends StatefulWidget {
  const NextSchedulesFutureBuilder({super.key, String? name});

  @override
  State<NextSchedulesFutureBuilder> createState() => _NextSchedulesState();
}

class _NextSchedulesState extends State<NextSchedulesFutureBuilder> {
  TextEditingController nameController = TextEditingController();

  Future scheduleFuture = getSchedules();

  static Future getSchedules() async {
    final db = Localstore.instance;
    final localStorageData =
        await db.collection('storageUser').doc('storageUser').get();
    var payload = {};
    payload["token"] = localStorageData?['token'];
    payload['clientId'] = localStorageData?['userId'];

    return await ScheduleRepository().getUserNextSchedules(payload);
  }

  getSituationTransform(situation) {
    var situationFormated = {};

    switch (situation) {
      case 'NAO_INICIADO':
        situationFormated['label'] = 'Não iniciado';
        situationFormated['color'] = Colors.yellow;
        break;
      case 'EM_ANDAMENTO':
        situationFormated['label'] = 'Em andamento';
        situationFormated['color'] = Colors.blue;
      case 'FINALIZADO':
        situationFormated['label'] = 'Finalizado';
        situationFormated['color'] = Colors.green;
      case 'CANCELADO':
        situationFormated['label'] = 'Cancelado';
        situationFormated['color'] = Colors.grey;

      default:
        situationFormated['label'] = 'Não iniciado';
        situationFormated['color'] = Colors.yellow;
    }

    return situationFormated;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // FutureBuilder
        child: FutureBuilder(
          future: scheduleFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final obj = snapshot.data!;
              return buildLayoutNextSchedules(obj);
            } else {
              return const Text("Sem dados.");
            }
          },
        ),
      ),
    );
  }

// function to display fetched data on screen
  Widget buildLayoutNextSchedules(obj) {
    return ListView.builder(
      itemCount: obj.length,
      itemBuilder: (context, index) {
        var thisSchedule = obj[index];
        // var id = thisSchedule['id'];
        var date = DateTime.tryParse(thisSchedule['date']);
        final f = DateFormat('dd/MM/yyyy');
        var formatedDate = f.format(date!);

        var situation = thisSchedule['situation'];
        var thisLaundry = thisSchedule['laundry'];
        final address = thisLaundry['address'];

        var st = getSituationTransform(situation);
        var situationLabel = st['label'];
        var situationColor = st['color'];

        return Container(
            // color: Colors.grey.shade300,
            // margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 60,
            // width: double.maxFinite,
            width: 50,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      height: 30,
                      width: double.maxFinite,
                      child: Center(
                        child: Text(formatedDate,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12.0,
                            )),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 2),
                      height: 30,
                      width: double.maxFinite,
                      child: Center(
                        child: Text(address,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12.0,
                            )),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: situationColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      height: 30,
                      width: double.maxFinite,
                      child: Center(
                        child: Text(situationLabel,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12.0,
                            )),
                      ),
                    )),

                    // Expanded(flex: 3, child: Text(situation)),
                  ],
                ),
                const SizedBox(height: 2),
              ],
            ));
      },
    );
  }
// }
}







    // return ListView.builder(
    //                     itemCount: dados.data?.length ?? 0,
    //                     itemBuilder: (context, index) {
    //                       var thisSchedule = dados.data[index];
    //                       // var id = thisSchedule['id'];
    //                       var date = DateTime.tryParse(thisSchedule['date']);
    //                       final f = DateFormat('dd/MM/YYYY');
    //                       var formatedDate = f.format(date!);

    //                       // var situation = thisSchedule['situation'];
    //                       // var thisLaundry = thisSchedule['laundry'];
    //                       // final address = thisLaundry['address'];
    //                       return const Expanded(
    //                         child: Text(
    //                           'jobson',
    //                           // overflow: TextOverflow.ellipsis,
    //                           style: TextStyle(
    //                             fontSize: 13.0,
    //                             fontFamily: 'Roboto',
    //                           ),
    //                         ),
    //                       );
    //                     });