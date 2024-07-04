// ignore_for_file: non_constant_identifier_names, prefer_function_declarations_over_variables

import 'package:flutter/src/widgets/editable_text.dart';
import 'package:http/http.dart' as http;
import 'package:lc_mobile_flutter/src/model/Interface.dart';
import 'package:lc_mobile_flutter/src/model/UserModel.dart';
import 'package:lc_mobile_flutter/src/service/AbstractService.dart';
import 'package:lc_mobile_flutter/src/service/persistense/UserPersist.dart';
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

    if (response.statusCode == 200) {
      // UserModel user = UserModel.fromJson(jsonDecode(response.body));
      // print(response.body);
      final body = json.decode(response.body);
      final data = body['data'];
      if (data != null) {
        final token = data['token'];
        final userId = data['userId'];
        print(data);

        // print('before user');
        // UserModel user = UserModel.fromJson(data);
        // print('user');
        // print(user);
        // UserPersist().salvar(user);

        return true;
      } else {
        return false;
      }
    } else {
      // print('problemas ' + resposta.statusCode.toString());
      // print('erro: ' + resposta.body.toString());
      return false;
    }
  }
}

userPersist() {
  //UserModel u = new UserModel(email: email, senha: '123', nome: 'alencar');
  // UserModel u1 =
  //     new UserModel(email: 'paula@teste', senha: '123', nome: 'paula');
  // UserModel u2 =
  //     new UserModel(email: 'angelica@teste', senha: '123', nome: 'angelica');
  // UserModel u3 =
  //     new UserModel(email: 'gabriela@teste', senha: '123', nome: 'gabriela');
  // UserModel u4 =
  //     new UserModel(email: 'luciana@teste', senha: '123', nome: 'luciana');
  // UserModel u5 = new UserModel(email: 'naty@teste', senha: '123', nome: 'naty');
  //print(u.toString());
  // new userPersist().salvar(u);
  // new userPersist().salvar(u1);
  // new userPersist().salvar(u2);
  // new userPersist().salvar(u3);
  // new userPersist().salvar(u4);
  // new userPersist().salvar(u5);
}
