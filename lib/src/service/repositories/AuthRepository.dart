// ignore_for_file: non_constant_identifier_names, prefer_function_declarations_over_variables
import 'package:http/http.dart' as http;
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
      if (body['success'] == true) {
        final data = body['data'];
        if (data != null) {
          final userId = data['userId'];
          final token = data['token'];
          final db = Localstore.instance;
          db
              .collection('storageUser')
              .doc('storageUser')
              .set({'userId': userId, 'token': token});
          return data;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
