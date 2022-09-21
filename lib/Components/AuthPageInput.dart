import 'package:discordbotadminui/Enums/ValidationTypes.dart';
import 'package:discordbotadminui/Extensions/TextStyleExtension.dart';
import 'package:discordbotadminui/Helpers/ThemeManager.dart';
import 'package:discordbotadminui/Helpers/TextStyleHelper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuthPageInput extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final ValidationTypes validationType;
  final String autofillHint;
  final Function validationResultCallback;
  final String? validationMessage;
  const AuthPageInput({
    Key? key,
    required this.controller,
    required this.text,
    required this.validationType,
    required this.autofillHint,
    required this.validationResultCallback,
    required this.validationMessage,
  }) : super(key: key);

  @override
  State<AuthPageInput> createState() => _AuthPageInputState();
}

class _AuthPageInputState extends State<AuthPageInput> {
  var valid = false;
  var repeatValid = false;
  var repeatConttoller = TextEditingController();
  bool _obscureText = true;
  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3.sp),
      child: Column(children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TextFormField(
                autofillHints: [widget.autofillHint],
                style: TextStyleHelper.get(context).defaultTextInputStyle,
                obscureText: widget.validationType == ValidationTypes.password
                    ? _obscureText
                    : false,
                controller: widget.controller,
                onChanged: (text) {
                  if (widget.validationType == ValidationTypes.email) {
                    if (!RegExp(
                            r"^[a-zA-Zа-яґєіїА-ЯҐЄІЇ0-9.a-zA-Zа-яґєіїА-ЯҐЄІЇ0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Zа-яґєіїА-ЯҐЄІЇ0-9]+\.[a-zA-Zа-яґєіїА-ЯҐЄІЇ]+")
                        .hasMatch(text)) {
                      setState(() {
                        valid = false;
                      });
                    } else {
                      setState(() {
                        valid = true;
                      });
                    }
                  } else if (widget.validationType ==
                      ValidationTypes.password) {
                    if (!RegExp(
                            r"^(?=.*[a-zа-яґєії])(?=.*[A-ZА-ЯҐЄІЇ])(?=.*\d)[a-zA-Zа-яґєіїА-ЯҐЄІЇ\d]{8,12}$")
                        .hasMatch(text)) {
                      setState(() {
                        valid = false;
                      });
                    } else {
                      setState(() {
                        valid = true;
                      });
                    }
                  }

                  widget.validationResultCallback(valid);
                },
                decoration: InputDecoration(
                    labelText: widget.text,
                    errorText: widget.validationMessage,
                    suffixIcon: Container(
                      padding: EdgeInsets.only(right: 1.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.validationType == ValidationTypes.password)
                            IconButton(
                              onPressed: _toggleObscure,
                              icon: _obscureText
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                          valid
                              ? Icon(
                                  Icons.done,
                                  color: ThemeManager.getTheme(context)
                                      .activeColor,
                                )
                              : Icon(
                                  Icons.close,
                                  color: ThemeManager.getTheme(context)
                                      .cancelColor,
                                ),
                        ],
                      ),
                    ),
                    labelStyle: TextStyleHelper.get(context)
                        .defaultTextInputStyle
                        .withFontSize(6.sp),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: ThemeManager.getTheme(context).activeColor)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: ThemeManager.getTheme(context).activeColor)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: ThemeManager.getTheme(context).activeColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color:
                                ThemeManager.getTheme(context).activeColor))),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
