import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:testeapp/app-core/model/cliente_model.dart';
// import 'package:testeapp/app-core/service/cliente_service.dart';
// import 'package:testeapp/screen/cliente/listar_cliente.dart';

class DashbordCliente extends StatelessWidget {
  const DashbordCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dasbord CLIENTES'),
        ),
        body: Container(
            color: Colors.red,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            width: double.infinity,
            child: Column(children: [
              ElevatedButton(
                child: Text('ADD CLIENTES'),
                onPressed: () {
                  debugPrint('clicou...');
                },
              ),
              ElevatedButton(
                child: Text('LISTAR CLIENTES'),
                onPressed: () {
                  /*   Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context){
                            return ListarClientes();
                          }));*/

                  // new ClienteService().getCliente().then((value) {
                  //   ClienteModel cliente =
                  //       ClienteModel.fromJson(jsonDecode(value.body));

                  //   print('id cliente: ' + cliente.id.toString());
                  //   print('nome cliente: ' + cliente.nome.toString());
                  // }).catchError((onError) {
                  //   print('erro --> ' + onError.toString());
                  // });

                  // Modular.to.pushNamed("/cliente/listar_clientes");
                },
              ),
            ])));
  }
}
