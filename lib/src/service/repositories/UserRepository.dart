import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lc_mobile_flutter/src/model/Interface.dart';
import 'package:lc_mobile_flutter/src/model/UserModel.dart';
import 'package:lc_mobile_flutter/src/service/AbstractService.dart';
import 'dart:convert';

import 'package:lc_mobile_flutter/src/service/types/endpoints.dart';

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

  Future createUser(payload) async {
    var name = payload["name"];
    var email = payload["email"];
    var phoneNumber = payload["phoneNumber"];
    var password = payload["password"];

    final response = await http.post(
      Uri.parse(API_REST + Endpoints().LIST_USERS),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      print(body);
      if (body != null && body != null) {
        return body;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
