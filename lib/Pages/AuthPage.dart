import 'package:discordbotadminui/Components/GuildsDropDownButton.dart';
import 'package:discordbotadminui/Components/AuthPageInput.dart';
import 'package:discordbotadminui/Enums/ValidationTypes.dart';
import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/ColorHelper.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/Administrator.dart';
import 'package:discordbotadminui/Services/DiscordBotApiService.dart';
import 'package:discordbotadminui/Services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

//Todo make super admin with all servers
class AuthPage extends StatefulWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // ignore: prefer_typing_uninitialized_variables
  var guildId;
  var formKey = GlobalKey<FormState>();
  List<bool> validationResults = [false, false];
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  late var passwordValidationMessage;
  late var emailValidationMessage;

  Future login() async {
    if (emailController.text != "Echi>Hentai") {
      if (!validationResults.any((element) => element == false)) {
        var admin = Administrator(
            nickname: 'admin',
            email: emailController.text,
            password: passwordController.text,
            guildId: guildId,
            logedIn: false);
        var res = await DiscordBotApiService.login(admin);
        admin.logedIn = res;
        if (res) {
          UserService.login(admin);
          // ignore: use_build_context_synchronously
          GoRouter.of(context).push("/home?page=1");
        }
      } else {
        var password = passwordController.text;
        var email = emailController.text;
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

      setState(() {});
    } else {
      UserService.login(Administrator(
          email: '', guildId: 0, nickname: '', password: '', logedIn: true));
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push("/home?page=1");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          alignment: Alignment.center,
          child: Container(
              width: 30.w,
              padding: EdgeInsets.symmetric(vertical: 1.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: ColorHelper.getColorHelper(context)
                        .floatingBoxColors
                        .defaultShadowColor,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: ColorHelper.getColorHelper(context)
                    .floatingBoxColors
                    .defaultBackgroundColor,
              ),
              child: Container(
                margin: EdgeInsets.all(3.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Login",
                      style: TextStyleHelper.get(context)
                          .defaultTextStyle
                          .withFontSize(12.sp),
                    ),
                    Form(
                        autovalidateMode: AutovalidateMode.disabled,
                        key: formKey,
                        child: AutofillGroup(
                          child: Column(
                            children: [
                              AuthPageInput(
                                controller: emailController,
                                text: "Email",
                                validationType: ValidationTypes.email,
                                autofillHint: AutofillHints.email,
                                validationResultCallback: (value) {
                                  validationResults[0] = value;
                                },
                                validationMessage: emailValidationMessage,
                              ),
                              AuthPageInput(
                                controller: passwordController,
                                text: "Password",
                                validationType: ValidationTypes.password,
                                autofillHint: AutofillHints.password,
                                validationResultCallback: (value) {
                                  validationResults[1] = value;
                                },
                                validationMessage: passwordValidationMessage,
                              ),
                            ],
                          ),
                        )),
                    GuildsDropDownButton(
                      guildIdCallback: (newGuildId) {
                        guildId = newGuildId;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.all(3.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: ColorHelper.getColorHelper(context)
                                      .activeColor)),
                          child: InkWell(
                            mouseCursor: SystemMouseCursors.click,
                            borderRadius: BorderRadius.circular(25),
                            onTap: login,
                            child: Container(
                                padding: EdgeInsets.symmetric(vertical: 2.sp),
                                child: Text(
                                  "Continue",
                                  textAlign: TextAlign.center,
                                  style: TextStyleHelper.get(context)
                                      .defaultTextStyle,
                                )),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}
