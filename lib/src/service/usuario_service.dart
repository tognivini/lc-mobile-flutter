// import 'dart:convert';

// import 'package:testeapp/app-core/model/usuario_model.dart';
// import 'package:testeapp/app-core/persistence/usuario_persistence.dart';
// import 'package:testeapp/app-core/service/AbstractService.dart';
// import 'package:http/http.dart' as http;

// class UsuarioService extends AbstractService{


//  Future<bool> login({required String email, required String senha}) async{
//     //print('fazer requisição para o back');
//     //print('pegar resposta do back');

//     final conteudo = json.encode(<String, String>{'login':email, 'senha':senha});

//    final resposta = await http.post(Uri.parse(API_REST+'/login'),
//         headers: headers, body: conteudo, encoding: null);

//    if(resposta.statusCode == 200){

//      UsuarioModel u = UsuarioModel.fromJson(jsonDecode(resposta.body));
//      print(u.email);
//      print(u.token);
//      new UsuarioPersistence().salvar(u);
//      return true;

//    }else{
//      print('problemas '+resposta.statusCode.toString());
//      print('erro: '+resposta.body.toString());
//     return false;
//    }

//   return false;

//   }

//   listar() async{
//     print('entrou no listar ....');
//     print(await new UsuarioPersistence().listar());

//   }

//   usuariosPersisntentes(){

//     //UsuarioModel u = new UsuarioModel(email: email, senha: '123', nome: 'alencar');
//     UsuarioModel u1 = new UsuarioModel(email: 'paula@teste', senha: '123', nome: 'paula');
//     UsuarioModel u2 = new UsuarioModel(email: 'angelica@teste', senha: '123', nome: 'angelica');
//     UsuarioModel u3 = new UsuarioModel(email: 'gabriela@teste', senha: '123', nome: 'gabriela');
//     UsuarioModel u4 = new UsuarioModel(email: 'luciana@teste', senha: '123', nome: 'luciana');
//     UsuarioModel u5 = new UsuarioModel(email: 'naty@teste', senha: '123', nome: 'naty');
//     //print(u.toString());
//    // new UsuarioPersistence().salvar(u);
//     new UsuarioPersistence().salvar(u1);
//     new UsuarioPersistence().salvar(u2);
//     new UsuarioPersistence().salvar(u3);
//     new UsuarioPersistence().salvar(u4);
//     new UsuarioPersistence().salvar(u5);
//   }

// }