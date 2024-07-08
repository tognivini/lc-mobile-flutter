// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'package:lc_mobile_flutter/src/service/AbstractService.dart';
import 'dart:convert';

import 'package:lc_mobile_flutter/src/service/types/endpoints.dart';

class ScheduleRepository extends AbstractService {
  Future getAvaliableHours(payload) async {
    var token = payload["token"];
    var laundryId = payload["laundryId"];
    var washMachineId = payload["washMachineId"];
    var date = payload["date"];

    final response = await http.get(
      Uri.parse(API_REST + Endpoints().CHECK_AVAILABLE_HOURS)
          .replace(queryParameters: {
        'laundryId': laundryId,
        'washMachineId': washMachineId,
        'date': date,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final data = body['data'];

      if (data != null) {
        return data;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
