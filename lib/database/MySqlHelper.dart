import 'package:mysql1/mysql1.dart';
import 'dart:async';
import 'package:gecko_app/models/gecko.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

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

  Future<List<Gecko>> fetchGeckos() async {
    //print("current api port    is   $port");
    //print("current api uri    is   ${dotenv.env['URL']}");
    //print("current api path    is   ${dotenv.env['GECKOS']}");
    String uriStr =
        '${dotenv.env['URL']}:${dotenv.env['PORT']}/${dotenv.env['GECKOS']}';
    //print(uriStr);
    Uri uri = Uri.parse(uriStr);
    //print("total uri is ${uri.toString()}");
    //TODO error handling when network error
    var responses = await http.get(uri).catchError((e) async {
      //TODO if network failed, use sqflite data
      print("error !!! $e");
    });
    //print("responses status code : ${responses.statusCode}");
    if (responses.statusCode == 200) {
      //print("ress is $ress");
      return compute(parseGeckos, responses.body);
    } else {
      //TODO if network failed, use sqflite data
      throw Exception('Failed load gecko');
    }
  }

  List<Gecko> parseGeckos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Gecko>((json) => Gecko.fromJson(json)).toList();
  }

  Future<List<Gecko>> selectGeckos(List<String> args) async {
    // Query the table for all The Geckos.
    List<Gecko> maps = [];
    //print("args length ------ ${args.length}");
    for (var i = 0; i < args.length; i++) {
      if (args[i] == "") continue;
      String uriStr =
          '${dotenv.env['URL']}:${dotenv.env['PORT']}/${dotenv.env['GECKOS']}/${args[i]}';
      print("------------------- uriStr = $uriStr");
      Uri uri = Uri.parse(uriStr);
      var response = await http.get(uri).catchError((e) async {
        //TODO if network failed, use sqflite data
        print("error !!! $e");
      });
      if (response.statusCode == 200) {
        var geckoJson = json.decode(response.body);
        maps.add(Gecko.fromJson(geckoJson));
      } else {
        throw Exception('Failed load gecko');
      }
    }
    return maps;
  }
}
