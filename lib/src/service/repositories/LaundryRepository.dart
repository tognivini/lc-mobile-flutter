// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'package:lc_mobile_flutter/src/service/AbstractService.dart';
import 'dart:convert';

import 'package:lc_mobile_flutter/src/service/types/endpoints.dart';

class LaundryRepository extends AbstractService {
  Future getAllLaundry(payload) async {
    var token = payload["token"];

    final response = await http.get(
      Uri.parse(API_REST + Endpoints().LIST_ALL_LAUNDRY),
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
