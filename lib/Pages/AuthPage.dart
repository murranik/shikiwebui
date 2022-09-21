import 'dart:math';

import 'package:discordbotadminui/Components/GuildsDropDownButton.dart';
import 'package:discordbotadminui/Components/AuthPageInput.dart';
import 'package:discordbotadminui/Enums/ValidationTypes.dart';
import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/ThemeManager.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:discordbotadminui/Models/Administrator.dart';
import 'package:discordbotadminui/Provider/AuthPageProvider.dart';
import 'package:discordbotadminui/Services/DiscordBotApiService.dart';
import 'package:discordbotadminui/Services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
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
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, AuthPageProvider authPageNotifier, widget) {
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
                      color: ThemeManager.getTheme(context)
                          .floatingBoxColors
                          .defaultShadowColor,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: ThemeManager.getTheme(context)
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
                                  controller: authPageNotifier
                                      .authPageControllers.emailController,
                                  text: "Email",
                                  validationType: ValidationTypes.email,
                                  autofillHint: AutofillHints.email,
                                  validationResultCallback: (bool value) {
                                    authPageNotifier.validationResults[0] =
                                        value;
                                  },
                                  validationMessage:
                                      authPageNotifier.emailValidationMessage,
                                ),
                                AuthPageInput(
                                  controller: authPageNotifier
                                      .authPageControllers.passwordController,
                                  text: "Password",
                                  validationType: ValidationTypes.password,
                                  autofillHint: AutofillHints.password,
                                  validationResultCallback: (bool value) {
                                    authPageNotifier.validationResults[1] =
                                        value;
                                  },
                                  validationMessage: authPageNotifier
                                      .passwordValidationMessage,
                                ),
                              ],
                            ),
                          )),
                      GuildsDropDownButton(
                        guildIdCallback: (String newGuildId) {
                          authPageNotifier.guildId = newGuildId;
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
                                    color: ThemeManager.getTheme(context)
                                        .activeColor)),
                            child: InkWell(
                              mouseCursor: SystemMouseCursors.click,
                              borderRadius: BorderRadius.circular(25),
                              onTap: () => authPageNotifier.login(context),
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 2.sp),
                                  child: Text(
                                    "Continue",
                                    textAlign: TextAlign.center,
                                    style: TextStyleHelper.get(context)
                                        .defaultTextInputStyle
                                        .withFontSize(6.sp),
                                  )),
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                ))),
      );
    });
  }
}
