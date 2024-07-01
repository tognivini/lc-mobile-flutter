// ignore_for_file: non_constant_identifier_names

import 'package:flutter/src/widgets/editable_text.dart';
import 'package:http/http.dart' as http;
import 'package:lc_mobile_flutter/src/model/Interface.dart';
import 'package:lc_mobile_flutter/src/model/UserModel.dart';
import 'package:lc_mobile_flutter/src/service/AbstractService.dart';
import 'dart:convert';

import 'package:lc_mobile_flutter/src/service/types/endpoints.dart';

class AuthRepository extends AbstractService {
  Future login(payload) async {
    var email = payload["email"];
    var password = payload["password"];

    final response = await http.post(
      Uri.parse(API_REST + Endpoints().LOGIN),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    print(response.body);

    if (response.statusCode == 200) {
      UserModel u = UserModel.fromJson(jsonDecode(response.body));
      print(u);
      // print(u.token);
      // new UsuarioPersistence().salvar(u);
      // return true;
    } else {
      // print('problemas ' + resposta.statusCode.toString());
      // print('erro: ' + resposta.body.toString());
      // return false;
    }
  }
}



// Future<UserModel?> login(Map<dynamic, String> map) async {
// // Future List<String> getFilmes() async {
//   print('start:?');

//   final response = await http.get(Uri.parse(Endpoints().LOGIN));

//   print('response:');
//   print(response);

//   if (response.statusCode == 200) {
//     final json = jsonDecode(response.body);
//     return json;
//   } else {
//     return null;
//   }
// }
