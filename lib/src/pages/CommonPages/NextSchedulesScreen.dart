// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  TextEditingController matriculaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  // final Future<String> _calculation = Future<String>.delayed(
  //   const Duration(seconds: 2),
  //   () => 'Data',
  // );

  //   Future userNextSchedules() async {
  //   final db = Localstore.instance;
  //   final localStorageData =
  //       await db.collection('storageUser').doc('storageUser').get();

  //   var payload = {};
  //   payload["token"] = localStorageData?['token'];
  //   payload["clientId"] = localStorageData?['userId'];
  //   return await (ScheduleRepository().getUserNextSchedules(payload)) as Future;
  // }

  // final Future _calculation = (getFilmes()) as Future;
  final Future _calculation = ScheduleRepository().getUserNextSchedules();

  criaTabelaNextSchedules() {
    return Table(
      defaultColumnWidth: const FixedColumnWidth(80.0),
      border: const TableBorder(
        horizontalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        verticalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      children: [
        _criarLinhaTable("Quarta, 22/05/24, 20:00"),
        _criarLinhaTable("Quinta, 23/05/24, 18:00"),
      ],
    );
  }

  criaTabelaLastSchedules() {
    return Table(
      defaultColumnWidth: const FixedColumnWidth(80.0),
      border: const TableBorder(
        horizontalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        verticalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      children: [
        _criarLinhaTable("Quarta, 22/03/24, 20:00"),
        _criarLinhaTable("Quarta, 22/03/24, 20:00"),
        _criarLinhaTable("Quarta, 22/03/24, 20:00"),
        _criarLinhaTable("Quarta, 22/03/24, 20:00"),
        _criarLinhaTable("Quarta, 22/03/24, 20:00"),
        _criarLinhaTable("Quarta, 22/03/24, 20:00"),
        _criarLinhaTable("Quinta, 23/03/24, 18:00"),
      ],
    );
  }

  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(1.0),
          child: Text(
            name,
            style: const TextStyle(fontSize: 12.0),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Próximos Agendamentos'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Text('Próximo Agendamentos',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 0, bottom: 0),
              child: FutureBuilder(
                  builder: (context, AsyncSnapshot dados) {
                    if (dados.connectionState == ConnectionState.none &&
                        dados.hasData == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: dados.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          var thisSchedule = dados.data[index];
                          // var id = thisSchedule['id'];
                          var date = DateTime.tryParse(thisSchedule['date']);
                          final f = DateFormat('dd/MM/YYYY');
                          var formatedDate = f.format(date!);

                          var situation = thisSchedule['situation'];
                          var thisLaundry = thisSchedule['laundry'];
                          final address = thisLaundry['address'];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                formatedDate ?? '-',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              Text(
                                situation ?? '-',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              // Flexible(
                              //   child: Container(
                              //     padding: const EdgeInsets.only(right: 13.0),
                              //     child: Text(
                              //       address,
                              //       overflow: TextOverflow.ellipsis,
                              //       style: const TextStyle(
                              //         fontSize: 13.0,
                              //         fontFamily: 'Roboto',
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  future: _calculation),
              // SingleChildScrollView(child: WidgetTable()),
            ),
            // const Padding(
            //   padding: EdgeInsets.only(top: 40, bottom: 20),
            //   child: Text('Últimos Agendamentos',
            //       style: TextStyle(color: Colors.black, fontSize: 18)),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10, left: 0, bottom: 10),
            //   child: criaTabelaLastSchedules(),
            //   // SingleChildScrollView(child: WidgetTable()),
            // ),
          ],
        ))
        // body: FutureBuilder(
        //     builder: (context, AsyncSnapshot dados) {
        //       if (dados.connectionState == ConnectionState.none &&
        //           dados.hasData == null) {
        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       } else {
        //         return ListView.builder(
        //           itemCount: dados.data?.length ?? 0,
        //           itemBuilder: (context, index) {
        //             var thisSchedule = dados.data[index];
        //             // var id = thisSchedule['id'];
        //             var date = DateTime.tryParse(thisSchedule['date']);
        //             final f = DateFormat('dd/MM/YYYY');
        //             var formatedDate = f.format(date!);

        //             var situation = thisSchedule['situation'];
        //             var thisLaundry = thisSchedule['laundry'];
        //             final address = thisLaundry['address'];
        //             return Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: <Widget>[
        //                 Text(
        //                   formatedDate ?? '-',
        //                   overflow: TextOverflow.ellipsis,
        //                   style: const TextStyle(
        //                     fontSize: 13.0,
        //                     fontFamily: 'Roboto',
        //                   ),
        //                 ),
        //                 Text(
        //                   situation ?? '-',
        //                   overflow: TextOverflow.ellipsis,
        //                   style: const TextStyle(
        //                     fontSize: 13.0,
        //                     fontFamily: 'Roboto',
        //                   ),
        //                 ),
        //                 Flexible(
        //                   child: Container(
        //                     padding: const EdgeInsets.only(right: 13.0),
        //                     child: Text(
        //                       address,
        //                       overflow: TextOverflow.ellipsis,
        //                       style: const TextStyle(
        //                         fontSize: 13.0,
        //                         fontFamily: 'Roboto',
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             );
        //           },
        //         );
        //       }
        //     },
        //     future: _calculation
        // future: null,
        // future: new UsuarioPersistence().listar(),
        // )
        );
  }
}
