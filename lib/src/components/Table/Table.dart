// import 'package:flutter/material.dart';

// class WidgetTable extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Widget Table"),
//       ),
//       body: criaTabela(),
//     );
//   }

//   criaTabela() {
//     return Table(
//       defaultColumnWidth: FixedColumnWidth(150.0),
//       border: const TableBorder(
//         horizontalInside: BorderSide(
//           color: Colors.black,
//           style: BorderStyle.solid,
//           width: 1.0,
//         ),
//         verticalInside: BorderSide(
//           color: Colors.black,
//           style: BorderStyle.solid,
//           width: 1.0,
//         ),
//       ),
//       children: [
//         _criarLinhaTable("Pontos, Time, Gols"),
//         _criarLinhaTable("25, Palmeiras,16 "),
//         _criarLinhaTable("20, Santos, 5"),
//         _criarLinhaTable("17, Flamento, 6"),
//       ],
//     );
//   }

//   _criarLinhaTable(String listaNomes) {
//     return TableRow(
//       children: listaNomes.split(',').map((name) {
//         return Container(
//           alignment: Alignment.center,
//           child: Text(
//             name,
//             style: TextStyle(fontSize: 20.0),
//           ),
//           padding: EdgeInsets.all(8.0),
//         );
//       }).toList(),
//     );
//   }
// }
