import 'dart:convert';

import 'package:discordbotadminui/Models/AdministrationGuild.dart';
import 'package:discordbotadminui/Models/Administrator.dart';
import 'package:discordbotadminui/Models/Audit/CommandCallInfo.dart';
import 'package:discordbotadminui/Models/DiscordRole.dart';
import 'package:discordbotadminui/Models/DiscordUser.dart';
import 'package:discordbotadminui/Services/UserService.dart';
import 'package:http/http.dart';

class DiscordBotApiService {
  static List<T> getModelsListFromMap<T>(request) {
    List<T> list = [];
    var data = json.decode(request.body);

    for (Map<String, dynamic> element in data) {
      if (T == AdministrationGuild) {
        list.add(AdministrationGuild.fromMap(element) as T);
      } else if (T == DiscordUser) {
        list.add(DiscordUser.fromMap(element) as T);
      } else if (T == DiscordRole) {
        list.add(DiscordRole.fromMap(element) as T);
      } else if (T == CommandCallInfo) {
        list.add(CommandCallInfo.fromMap(element) as T);
      }
    }

    return list;
  }

  static Future<String?> getServerStatus() async {
    var request = await get(Uri.parse('https://localhost:5001/api/Status'));

    if (request.statusCode == 200) {
      return request.body;
    }

    return null;
  }

  static Future<bool?> userExist(String email) async {
    var request =
        await get(Uri.parse('https://localhost:5001/api/IsExist?email=$email'));

    if (request.statusCode == 200) {
      return request.body.toLowerCase() == "true" ? true : false;
    }

    return null;
  }

  static Future<List<T>> fetchData<T>(String uri) async {
    var request = await get(Uri.parse(uri));
    if (request.statusCode == 200) {
      return getModelsListFromMap<T>(request);
    }

    return [];
  }

  static Future changeUserPrestigeLevel(String id, int newLevel) async {
    var url = Uri.parse(
        'https://localhost:5001/api/Update/ChangeUserPrestigeLevel?userDiscordId=$id&newLevel=$newLevel');
    var res = await post(url);
    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }

    return "";
  }

  static Future<bool> login(Administrator admin) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var data = '''{
      "nickname": "login",
      "email": "${admin.email}",
      "password": "${admin.password}",
      "guildId": ${admin.guildId}
    }''';

    var url = Uri.parse('https://localhost:5001/api/Administration');
    var res = await post(url, headers: headers, body: data);
    if (res.statusCode != 200) {
      return false;
    }

    return true;
  }
}
