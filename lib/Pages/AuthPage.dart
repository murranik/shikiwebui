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

  Future login() async {
    if (!validationResults.any((element) => element == false)) {
      formKey.currentState?.validate();
      var admin = Administrator(
          nickname: 'admin',
          email: emailController.text,
          password: passwordController.text,
          guildId: guildId,
          logedIn: false);
      var res = await DiscordBotApiService.login(admin);
      admin.logedIn = res;
      if (res) {
        UserService.saveUser(admin);
        // ignore: use_build_context_synchronously
        GoRouter.of(context).push("/home");
      }
      setState(() {});
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
                        .serverStatusColors
                        .defaultShadowColor,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: ColorHelper.getColorHelper(context)
                    .serverStatusColors
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
                      style: TextStyleHelper.getTextStyleHelper(context)
                          .defaultTextStyle
                          .withFontSize(12.sp),
                    ),
                    Form(
                        autovalidateMode: AutovalidateMode.always,
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
                              ),
                              AuthPageInput(
                                controller: passwordController,
                                text: "Password",
                                validationType: ValidationTypes.password,
                                autofillHint: AutofillHints.password,
                                validationResultCallback: (value) {
                                  validationResults[1] = value;
                                },
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
                                  style: TextStyleHelper.getTextStyleHelper(
                                          context)
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
