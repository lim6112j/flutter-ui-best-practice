import 'package:flutter_test/flutter_test.dart';
import 'package:gecko_app/database/MySqlHelper.dart';
import 'package:mysql1/mysql1.dart';

Future<void> main() async {
  var db = await MySqlHelper().database;
  group('Mysql Tests', () {
    test('MySqlHelper Connection Test', () async {
      var results = await db.query("select * from person");
      for (var p in results) {
        print(p);
      }
      expect(results.length, 1);
    });

    test('create record test', () async {
      await db.query("DROP TABLE IF EXISTS t1");
      await db.query("CREATE TABLE IF NOT EXISTS t1 (a int)");
      var r = await db.query("INSERT INTO t1 (a) VALUES (?)", [1]);

      // existing data
      r = await db.query("SELECT * FROM t1 where a = ?", [1]);
      expect(r.length, 1);

      // not existing data
      r = await db.query("SELECT * FROM t1 where a = ?", [2]);
      expect(r.length, 0);

      // drop table that doesn't exist
      try {
        await db.query('DROP TABLE doensnotexist');
        expect(true, false);
      } on MySqlException catch (e) {
        expect(e.errorNumber, 1051);
      }

      // check the conn is ok after error above
      r = await db.query('SELECT * FROM t1 where a = ?', [1]);
      expect(r.length, 1);
    });

    test('Queued queries test', () async {
      Future _;
      _ = db.query('DROP TABLE IF EXISTS t1');
      _ = db.query('CREATE TABLE IF NOT EXISTS t1 (a int)');
      var f1 = db.query("SELECT * FROM t1 where a = ?", [1]);
      _ = db.query('INSERT INTO t1 (a) VALUES (?)', [1]);
      var f2 = db.query('SELECT * FROM t1 WHERE a = ?', [1]);
      var r1 = await f1;
      expect(r1.length, 0);
      var r2 = await f2;
      expect(r2.length, 1);
    });

    test('stored procedure', () async {
      await db.query('DROP PROCEDURE IF EXISTS p');
      await db.query('''CREATE PROCEDURE IF NOT EXISTS p (a DOUBLE, B DOUBLE)
     BEGIN
     SELECT a*b;
     END
     ''');
      var results = await db.query('Call p(2,3)');
      expect(results.first.first, 6);
    });
  });
}
