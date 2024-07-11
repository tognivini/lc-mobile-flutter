// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lc_mobile_flutter/src/components/NextSchedulesFutureBuilder/NextSchedulesFutureBuilder.dart';
import 'package:lc_mobile_flutter/src/service/repositories/ScheduleRepository.dart';
import 'package:lc_mobile_flutter/src/service/repositories/repository.dart';
import 'package:localstore/localstore.dart';

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
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: Text('Próximo Agendamentos',
                style: TextStyle(color: Colors.black, fontSize: 18)),
          ),
          Container(
              color: Colors.grey.shade300,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              height: 100,
              width: 300,
              child: const NextSchedulesFutureBuilder()),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text('Próximo Agendamentos',
                style: TextStyle(color: Colors.black, fontSize: 18)),
          ),
          Container(
              // color: Colors.grey.shade300,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              height: 200,
              width: 300,
              child: const NextSchedulesFutureBuilder()),
        ]),
      ),
    );
  }
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
    //                       return const ,
    //                       );
    //                     });