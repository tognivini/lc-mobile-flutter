import 'package:flutter/material.dart';
// import 'package:testeapp/app-core/model/usuario_model.dart';
// import 'package:testeapp/app-core/persistence/usuario_persistence.dart';

class ListarClientes extends StatelessWidget {
  const ListarClientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LISTA DE CLIENTES'),
        ),
        body: FutureBuilder(
          builder: (context, AsyncSnapshot dados) {
            if (dados.connectionState == ConnectionState.none &&
                dados.hasData == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                child: ListView.builder(
                  itemCount: dados.data.length,
                  itemBuilder: (context, index) {
                    UsuarioModel us = dados.data[index];
                    return Column(
                      children: <Widget>[Text("Usuario")],
                    );
                  },
                ),
              );
            }
          },
          // future: new UsuarioPersistence().listar(),
        ));
  }
}
