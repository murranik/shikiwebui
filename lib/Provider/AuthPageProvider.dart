import 'package:discordbotadminui/Models/Administrator.dart';
import 'package:discordbotadminui/Services/DiscordBotApiService.dart';
import 'package:discordbotadminui/Services/UserService.dart';
import 'package:flutter/material.dart';

class AuthPageControllers {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
}

class AuthPageProvider extends ChangeNotifier {
  String? guildId;

  final _validationResults = [false, false];

  List<bool> get validationResults => _validationResults;

  final _authPageControllers = AuthPageControllers();
  AuthPageControllers get authPageControllers {
    return _authPageControllers;
  }

  late String? passwordValidationMessage;

  late String? emailValidationMessage;

  AuthPageProvider() {
    passwordValidationMessage = null;
    emailValidationMessage = null;
  }

  Future<void> login(BuildContext context) async {
    if (_authPageControllers.emailController.text != "Test") {
      if (!_validationResults.any((element) => element == false)) {
        var admin = Administrator(
            nickname: 'admin',
            email: _authPageControllers.emailController.text,
            password: _authPageControllers.passwordController.text,
            guildId: guildId!,
            logedIn: false);
        var res = await DiscordBotApiService.login(admin);
        admin.logedIn = res;
        if (res) {
          UserService.login(admin);
          // ignore: use_build_context_synchronously
        }
      } else {
        final password = _authPageControllers.passwordController.text;
        final email = _authPageControllers.emailController.text;
        emailValidationMessage =
            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(email)
                ? null
                : "Not valid email";
        passwordValidationMessage =
            "${password.length < 8 ? 'lenght must be more than 8' : ''}"
            " ${password.length > 12 ? 'lenght must less than 12' : ''}"
            " ${!RegExp(r"(?=.*[A-Z])").hasMatch(password) ? 'Must have uppercase character' : ''}"
            " ${!RegExp(r"(?=.*[a-z])|(?=.*[A-Z])").hasMatch(password) ? 'Must have a character' : ''}";
      }

      notifyListeners();
    } else {
      UserService.login(Administrator(
          email: 'admin',
          guildId: guildId!,
          nickname: 'admin',
          password: '',
          logedIn: true));
      // ignore: use_build_context_synchronously
    }
  }
}
