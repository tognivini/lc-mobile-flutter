// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member

import 'package:flutter/material.dart';

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
          child: Text(
            name,
            style: TextStyle(fontSize: 12.0),
          ),
          padding: EdgeInsets.all(1.0),
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
              padding: const EdgeInsets.only(top: 10, left: 0, bottom: 10),
              child: criaTabelaNextSchedules(),
              // SingleChildScrollView(child: WidgetTable()),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Text('Últimos Agendamentos',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 0, bottom: 10),
              child: criaTabelaLastSchedules(),
              // SingleChildScrollView(child: WidgetTable()),
            ),
          ],
        )));
  }
}
