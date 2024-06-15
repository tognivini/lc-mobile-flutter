// // ignore_for_file: file_names, avoid_print, override_on_non_overriding_member

// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _ThisState();
// }

// class _ThisState extends State<HomeScreen> {
//   TextEditingController nomeController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Center(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Home Screen'),
//             TextButton(
//               style: ButtonStyle(
//                 foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
//               ),
//               onPressed: () {
//                 Navigator.pushNamed(
//                   context,
//                   // '/login/1',
//                   '/logged/profile/1',
//                 );
//               },
//               child: const Text('Perfil'),
//             ),
//             TextButton(
//               style: ButtonStyle(
//                 foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
//               ),
//               onPressed: () {
//                 Navigator.pushNamed(
//                   context,
//                   // '/login/1',
//                   '/login/1',
//                 );
//               },
//               child: const Text('Logout'),
//             ),
//           ],
//         )));
//   }
// }
