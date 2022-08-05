import 'dart:convert';

import 'package:discordbotadminui/Models/Administrator.dart';
import 'package:discordbotadminui/Services/CacheService.dart';

class UserService {
  static var _user = Administrator(
      email: '', guildId: 0, nickname: '', password: '', logedIn: false);

  static getUser() => _user;

  static Future saveUser(Administrator administrator) async {
    await CacheServices.saveUser(administrator);
    _user = administrator;
  }

  static loadUser() {
    var data = CacheServices.loadUser();
    if (data != null) {
      _user = Administrator.fromMap(json.decoder.convert(data));
    }
  }
}
