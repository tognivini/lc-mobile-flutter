// ignore_for_file: non_constant_identifier_names, prefer_function_declarations_over_variables

import 'package:flutter/src/widgets/editable_text.dart';
import 'package:http/http.dart' as http;
import 'package:lc_mobile_flutter/src/model/Interface.dart';
import 'package:lc_mobile_flutter/src/model/UserModel.dart';
import 'package:lc_mobile_flutter/src/service/AbstractService.dart';
import 'dart:convert';

import 'package:lc_mobile_flutter/src/service/types/endpoints.dart';
import 'package:localstore/localstore.dart';

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
      final body = json.decode(response.body);
      final data = body['data'];
      final userId = data['userId'];
      final token = data['token'];
      if (data != null) {
        // gets new id
        final db = Localstore.instance;

        // final id = db.collection('storageUser').doc().id;
        final id = db.collection('storageUser').doc().id;
        // // save the item
        db
            .collection('storageUser')
            // .doc(id)
            .doc('storageUser')
            .set({'userId': userId, 'token': token});
        // Gets item by id
        // final data = await db.collection('todos').doc(id).get();
        // Delete item by id
        // db.collection('todos').doc(id).delete();
        // Fetch the documents for the collection
        // final items = await db.collection('todos').get();
        // final token = data['token'];
        // final userId = data['userId'];
        return data;
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
