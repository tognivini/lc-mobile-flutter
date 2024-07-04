import 'package:lc_mobile_flutter/src/model/UserModel.dart';
import 'package:lc_mobile_flutter/src/service/persistense/openDatabase.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:testeapp/app-core/model/usuario_model.dart';

class UserPersist {
  static const String _nameTabela = 'usuario';
  static const String _col_userId = 'userId';
  static const String _col_email = 'email';
  static const String _col_name = 'name';
  static const String _col_token = 'token';
  // static const String _col_password = 'password';

  static const String createTabelaUsuario = 'CREATE TABLE $_nameTabela ('
      '$_col_userId INTEGER PRIMARY KEY, '
      '$_col_name TEXT,'
      '$_col_email TEXT,'
      '$_col_token TEXT)';
  // '$_col_password TEXT

  salvar(UserModel u) async {
    print('salvando usuário: ' + u.toString());

    final db = await getDatabase();

    await db.insert(_nameTabela, u.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<UserModel>?> listar() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_nameTabela);

    print('qtd: ' + maps.length.toString());

    List.generate(maps.length, (i) {
      //return UserModel.fromJson(maps[i]);
      return UserModel(
        userId: maps[i]["userId"],
        email: maps[i]["email"],
        name: maps[i]["name"],
        token: maps[i]["token"],
        // password: maps[i]["password"]
      );
    });
  }
}
