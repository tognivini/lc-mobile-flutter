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
    return await ScheduleRepository().getUserNextSchedules();
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
              // until data is fetched, show loader
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final obj = snapshot.data!;
              return buildLayoutNextSchedules(obj);
            } else {
              // if no data, show simple Text
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

// function to display fetched data on screen
  Widget buildLayoutNextSchedules(obj) {
    // ListView Builder to show data in a list
    print(obj[0]);
    // print(obj[0]['title']);
    // var title = obj[index]['title'];

    return ListView.builder(
      itemCount: obj.length,
      itemBuilder: (context, index) {
        final post = obj[index];
        final situation = obj[index]['situation'];
        return Container(
          color: Colors.grey.shade300,
          // margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 20,
          // width: double.maxFinite,
          width: 40,
          child: Row(
            children: [
              // Expanded(flex: 1, child: Image.network(post.url!)),
              // const SizedBox(width: 10),
              Expanded(
                  child: Text(
                situation,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13.0,
                  fontFamily: 'Roboto',
                ),
              ))
              // Expanded(flex: 3, child: Text(situation)),
            ],
          ),
        );
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