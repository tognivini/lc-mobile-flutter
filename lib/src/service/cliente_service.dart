import 'package:lc_mobile_flutter/src/service/AbstractService.dart';
import 'package:lc_mobile_flutter/src/model/cliente_model.dart';

import 'package:http/http.dart' as http;

class ClienteService extends AbstractService {
  Future<http.Response> getCliente() async {
    Map<String, String> headers_cliente = <String, String>{
      'Content-type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaWV0cmFAdGVzdGUiLCJwZXJtaXNzb2VzOiAiOm51bGwsImV4cCI6MTY1NDIwMTIzNn0.04I4vzNvBB7E8hj2IKxD3M6WvGtns5RcTQ_SYT0jWLo'
    };

    return http.get(Uri.parse(API_REST + '/cliente/cliente'),
        headers: headers_cliente);
  }
}
