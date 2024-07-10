// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member
import 'dart:convert';

import 'package:http/http.dart' as http;

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

  // criaTabelaNextSchedules() {
  //   return Table(
  //     defaultColumnWidth: const FixedColumnWidth(80.0),
  //     border: const TableBorder(
  //       horizontalInside: BorderSide(
  //         color: Colors.black,
  //         style: BorderStyle.solid,
  //         width: 1.0,
  //       ),
  //       verticalInside: BorderSide(
  //         color: Colors.black,
  //         style: BorderStyle.solid,
  //         width: 1.0,
  //       ),
  //     ),
  //     children: [
  //       _criarLinhaTable("Quarta, 22/05/24, 20:00"),
  //       _criarLinhaTable("Quinta, 23/05/24, 18:00"),
  //     ],
  //   );
  // }

  // criaTabelaLastSchedules() {
  //   return Table(
  //     defaultColumnWidth: const FixedColumnWidth(80.0),
  //     border: const TableBorder(
  //       horizontalInside: BorderSide(
  //         color: Colors.black,
  //         style: BorderStyle.solid,
  //         width: 1.0,
  //       ),
  //       verticalInside: BorderSide(
  //         color: Colors.black,
  //         style: BorderStyle.solid,
  //         width: 1.0,
  //       ),
  //     ),
  //     children: [
  //       _criarLinhaTable("Quarta, 22/03/24, 20:00"),
  //       _criarLinhaTable("Quarta, 22/03/24, 20:00"),
  //       _criarLinhaTable("Quarta, 22/03/24, 20:00"),
  //       _criarLinhaTable("Quarta, 22/03/24, 20:00"),
  //       _criarLinhaTable("Quarta, 22/03/24, 20:00"),
  //       _criarLinhaTable("Quarta, 22/03/24, 20:00"),
  //       _criarLinhaTable("Quinta, 23/03/24, 18:00"),
  //     ],
  //   );
  // }

  // _criarLinhaTable(String listaNomes) {
  //   return TableRow(
  //     children: listaNomes.split(',').map((name) {
  //       return Container(
  //         alignment: Alignment.center,
  //         padding: const EdgeInsets.all(1.0),
  //         child: Text(
  //           name,
  //           style: const TextStyle(fontSize: 12.0),
  //         ),
  //       );
  //     }).toList(),
  //   );
  // }

  Future postsFuture = getPosts();
  Future scheduleFuture = getSchedules();

  static Future getPosts() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1/photos");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    print('----------------->');
    // print(response.body);

    return json.decode(response.body);
    // return jsonDecode(response.body);
    // return body.map((e) => Post.fromJson(e)).toList();
  }

  static Future getSchedules() async {
    return await ScheduleRepository().getUserNextSchedules();
  }

  // Future<bool>? _future;
  // @override
  // void initState() {
  //   super.initState();
  //   _future = myFuture();
  // }

  // Future<bool> myFuture() async {
  //   await Future.delayed(const Duration(
  //       seconds: 2)); //Aguarda 2 segundos para prosseguir com o resto do código
  //   var currentSeccond = DateTime.now().second; //Salva o segundo da hora atual
  //   debugPrint(
  //       'currentSeccond = $currentSeccond'); //Printa o número no DEBUG CONSOLE
  //   return currentSeccond
  //       .isEven; //Retorna TRUE quando o número for par, FALSE quando ímpar
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // FutureBuilder
        child: FutureBuilder(
          future: postsFuture,
          // future: scheduleFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // until data is fetched, show loader
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              // once data is fetched, display it on screen (call buildPosts())
              final posts = snapshot.data!;
              return buildPosts(posts);
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
  Widget buildPosts(posts) {
    // ListView Builder to show data in a list
    print(posts[0]);
    print(posts[0]['title']);
    // var title = posts[index]['title'];

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        final title = posts[index]['title'];
        return Container(
          color: Colors.grey.shade300,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 100,
          width: double.maxFinite,
          child: Row(
            children: [
              // Expanded(flex: 1, child: Image.network(post.url!)),
              SizedBox(width: 10),
              Expanded(flex: 3, child: Text(title)),
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