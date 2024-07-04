import 'package:lc_mobile_flutter/src/service/persistense/UserDAO.dart';
import 'package:lc_mobile_flutter/src/service/repositories/AuthRepository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  print('abrindo conexao com o banco');

  return openDatabase(join(await getDatabasesPath(), 'dblc.db'),
      onCreate: (db, version) async {
    db.execute(UserDAO.sqlTableUser);
    //print('sql: '+UserPersist.createTabelaUsuario);
    //await db.execute(UserPersist.createTabelaUsuario);

    List<String> queryes = [userPersist().createTabelaUsuario];

    print('getDatabasesPath(): ' + getDatabasesPath().toString());
    for (String sql in queryes) {
      print('sql: ' + sql);

      db.execute(sql);
    }
  }, version: 1);
}
