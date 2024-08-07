import 'package:http/http.dart' as http;
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
      Uri.parse(API_REST + Endpoints().CREATE_USER),
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
      if (body != null) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future onUpdateUser(payload) async {
    var token = payload["token"];
    var userId = payload["userId"];
    var name = payload["name"];
    var email = payload["email"];
    var phoneNumber = payload["phoneNumber"];
    var password = payload["password"];

    final response = await http.put(
      Uri.parse(API_REST + Endpoints().EDIT_USER + userId),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': token,
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
      final data = body['data'];
      if (body != null && data != null) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
