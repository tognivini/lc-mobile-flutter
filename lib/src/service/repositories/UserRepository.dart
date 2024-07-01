import 'package:http/http.dart' as http;
import 'package:lc_mobile_flutter/src/model/Interface.dart';
import 'package:lc_mobile_flutter/src/model/UserModel.dart';
import 'package:lc_mobile_flutter/src/service/AbstractService.dart';
import 'dart:convert';

import 'package:lc_mobile_flutter/src/service/types/endpoints.dart';

class UserRepository extends AbstractService {
  Future<bool> login({required ILogin payload}) async {
    // required String email, required String senha}
    //print('fazer requisição para o back');
    //print('pegar resposta do back');
    // var email = payload.email;

    // final conteudo = json.encode(
    //     <String, String>{'email': email, 'senha': payload.senha});

    final response = await http.post(Uri.parse(API_REST + Endpoints().LOGIN),
        headers: headers, body: payload, encoding: null);

    print('response');
    print(response);

    if (response.statusCode == 200) {
      // UsuarioModel u = UsuarioModel.fromJson(jsonDecode(resposta.body));
      // print(u.email);
      // print(u.token);
      // new UsuarioPersistence().salvar(u);
      return true;
    } else {
      // print('problemas ' + resposta.statusCode.toString());
      // print('erro: ' + resposta.body.toString());
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
