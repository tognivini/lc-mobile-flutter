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

  Future getUserNextSchedules(payload) async {
    var token = payload["token"];
    var clientId = payload["clientId"];
    final response = await http.get(
      Uri.parse(API_REST + Endpoints().LIST_SCHEDULES)
          .replace(queryParameters: {
        'clientId': clientId,
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
        // print(data[0]);
        // return data;
        return data;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  // Future getUserNextSchedules(payload) async {
  //   var token = payload["token"];
  //   var clientId = payload["clientId"];

  //   final response = await http.get(
  //     Uri.parse(API_REST + Endpoints().LIST_SCHEDULES)
  //         .replace(queryParameters: {
  //       'clientId': clientId,
  //     }),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //       'Authorization': token,
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final body = json.decode(response.body);
  //     final data = body['data'];

  //     if (data != null) {
  //       // return data;
  //       return body;
  //     } else {
  //       return false;
  //     }
  //   } else {
  //     return false;
  //   }
  // }

  Future onCreateSchedule(payload) async {
    var token = payload["token"];
    var date = payload["date"];
    var laundry = payload["laundry"];
    var washMachine = payload["washMachine"];
    var startHour = payload["startHour"];
    var endHour = payload["endHour"];
    var responsible = payload["responsible"];
    var client = payload["client"];

    final response = await http.post(
      Uri.parse(API_REST + Endpoints().CREATE_SCHEDULE),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': token,
      },
      body: json.encode({
        'date': date,
        'laundry': laundry,
        'washMachine': washMachine,
        'startHour': startHour,
        'endHour': endHour,
        'responsible': responsible,
        'client': client,
      }),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final data = body['data'];

      if (data != null) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
