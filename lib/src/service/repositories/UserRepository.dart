import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lc_mobile_flutter/src/model/Interface.dart';
import 'package:lc_mobile_flutter/src/model/UserModel.dart';
import 'package:lc_mobile_flutter/src/service/AbstractService.dart';
import 'dart:convert';

import 'package:lc_mobile_flutter/src/service/types/endpoints.dart';

// final response = await http.get(
//   Uri.parse(API_REST + Endpoints().LIST_USERS),
//   headers: <String, String>{
//     'Content-Type': 'application/json',
//     'Authorization': token,
//   },
// );
class UserRepository extends AbstractService {
  Future getUserById(payload) async {
    var userId = payload["userId"];
    var token = payload["token"];

    final response = await http.get(
      Uri.parse(API_REST + Endpoints().LIST_USERS).replace(queryParameters: {
        'userId': userId,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      if (body != null && body[0] != null) {
        return body[0];
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}

// Future<List<UserModel>> getAllUsers() async {
// // Future List<String> getFilmes() async {
//   final response = await http.get(Uri.parse(Endpoints().LIST_USERS));

//   if (response.statusCode == 200) {
//     final json = jsonDecode(response.body);

//     // print(response.body.runtimeType);

//     return List<UserModel>.from(json.map((element) {
//       return UserModel.fromJson(element);
//     }));
//   } else {
//     return Future.error("Ops! Um erro ocorreu.");
//   }
// }
