import 'package:mysql1/mysql1.dart';
import 'dart:async';

class MySqlHelper {
  MySqlHelper._();
  static final MySqlHelper _mySqlHelper = MySqlHelper._();
  factory MySqlHelper() => _mySqlHelper;
  static MySqlConnection? _conn;
  Future<MySqlConnection> get database async {
    return _conn ??= await initDB();
  }

  initDB() async {
    return _conn = await MySqlConnection.connect(
        ConnectionSettings(user: 'root', db: 'testdb'));
  }
}
