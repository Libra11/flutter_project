/*
 * @Author: Libra
 * @Date: 2021-11-18 11:35:48
 * @LastEditTime: 2021-11-19 10:06:38
 * @LastEditors: Libra
 * @Description: 登录输入框
 * @FilePath: /test_flutter/lib/widget/login_input.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/util/color.dart';

class LoginInput extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  const LoginInput(
      {Key? key,
      required this.hintText,
      this.obscureText = false,
      this.controller})
      : super(key: key);

  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText,
      cursorColor: primary,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: lightColor,
          fontSize: 15,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: primary, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary, width: 1),
        ),
      ),
    );
  }
}
