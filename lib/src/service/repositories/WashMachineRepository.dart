// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'package:lc_mobile_flutter/src/service/AbstractService.dart';
import 'dart:convert';

import 'package:lc_mobile_flutter/src/service/types/endpoints.dart';

// interface IWashMachineParams {
//   model: string;
//   number: string;
//   inOpperation: boolean;
//   laundry: {
//     id: ILaundryInterface;
//   };
// }

class WashMachineRepository extends AbstractService {
  Future getAllWashMashines(payload) async {
    var token = payload["token"];

    var laundry = {};
    laundry['id'] = '3bc76eec-97d6-414c-b987-feff690c7219';

    print('start repo');
    print(laundry);

    final response = await http.get(
      Uri.parse(API_REST + Endpoints().GET_WASH_MACHINE)
          .replace(queryParameters: {
        'laundry': laundry,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': token,
      },
    );

    print('response');
    print(response.body);

    // if (response.statusCode == 200) {
    //   final body = json.decode(response.body);
    //   final data = body['data'];

    //   if (data != null) {
    //     return data;
    //   } else {
    //     return false;
    //   }
    // } else {
    //   return false;
    // }
  }
}
