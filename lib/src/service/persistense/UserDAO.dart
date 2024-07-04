// ignore_for_file: constant_identifier_names
import 'package:lc_mobile_flutter/src/model/UserModel.dart';
import 'package:lc_mobile_flutter/src/service/persistense/openDatabase.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:flutter/cupertino.dart';

class UserDAO {
  // static final List<UserModel> _users = List();

  static const String _tableName = 'user';
  static const String _col_userId = 'userId';
  static const String _col_email = 'email';
  static const String _col_name = 'name';
  // static const String _col_password = 'password';
  static const String _col_token = 'token';

  static const String sqlTableUser = 'CREATE TABLE $_tableName ('
      // '$_col_userId INTEGER PRIMARY KEY , '
      '$_col_userId TEXT, '
      '$_col_email TEXT, '
      '$_col_name  TEXT, '
      // '$_col_password TEXT , '
      '$_col_token TEXT)';

  // static add(UserModel u) async {
  //   _users.add(u);

  //   final Database db = await getDatabase();
  //   await db.insert(_tableName, u.toMap());
  // }
}
