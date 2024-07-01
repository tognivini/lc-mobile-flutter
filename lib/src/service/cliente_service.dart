import 'package:lc_mobile_flutter/src/service/AbstractService.dart';
import 'package:lc_mobile_flutter/src/model/cliente_model.dart';

import 'package:http/http.dart' as http;

class ClienteService extends AbstractService {
  Future<http.Response> getCliente() async {
    Map<String, String> headersCliente = <String, String>{
      'Content-type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI3NWI3ZmFiNy00ZjJlLTRmZjMtYWI2Ny0xZjQ4Yjk5NDBmNTAiLCJwZXJtaXNzaW9uVHlwZSI6IkNMSUVOVEUiLCJpYXQiOjE3MTk3OTIyMzgsImV4cCI6MTcyMDA1MTQzOH0.CJdgyEqdrz33odjIctu7ReGTw6R-IEWoxJu5b9hM1cY'
    };

    return http.get(Uri.parse('$API_REST/cliente/cliente'),
        headers: headersCliente);
  }
}
