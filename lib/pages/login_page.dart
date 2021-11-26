/*
 * @Author: Libra
 * @Date: 2021-11-18 12:40:02
 * @LastEditTime: 2021-11-23 15:01:12
 * @LastEditors: Libra
 * @Description: 登录页面
 * @FilePath: /test_flutter/lib/pages/login_page.dart
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_flutter/http/core/hi_error.dart';
import 'package:test_flutter/http/dao/login_dao.dart';
import 'package:test_flutter/http/dao/validate_dao.dart';
import 'package:test_flutter/main.dart';
import 'package:test_flutter/util/color.dart';
import 'package:test_flutter/util/font.dart';
import 'package:test_flutter/util/toast.dart';
import 'package:test_flutter/widget/common_button.dart';
import 'package:test_flutter/widget/common_layout.dart';
import 'package:test_flutter/widget/login_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _imgCodeController = TextEditingController();
  // 图片验证码
  var img;
  // 图片验证码key
  var key;

  @override
  void initState() {
    validate();
    super.initState();
  }

  // 获取图片验证码
  validate() async {
    var res = await ValidateDao.validate();
    res = res.data;
    String validateCode = res['data']['imageCode'];
    key = res['data']['key'];
    validateCode = validateCode.split(',')[1];
    img = Base64Decoder().convert(validateCode);
    setState(() {
      img;
      key;
    });
  }

  // 登录
  login() async {
    var loginName = _nameController.text;
    var loginPassword = _passwordController.text;
    var imageCode = _imgCodeController.text;
    try {
      await LoginDao.login(imageCode, key, loginName, loginPassword);
      delegate.push(name: '/basic');
    } on HiNetError catch (e) {
      clear();
      ToastUtil.showToast(e.message);
    }
  }

// 清空输入框，并更新图片验证码
  clear() {
    setState(() {
      _nameController.clear();
      _passwordController.clear();
      _imgCodeController.clear();
      validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hasLogo: true,
      widget: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text("滴滴2021校园招聘在线考试", style: fs24, textAlign: TextAlign.center),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: shadowColor1, blurRadius: 8, spreadRadius: 0),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.person, color: lightColor, size: 30),
                      SizedBox(
                        width: 10,
                      ),
                      Text("用户登录", style: fs18),
                    ]),
                SizedBox(
                  height: 40,
                ),
                LoginInput(hintText: '请输入账号', controller: _nameController),
                SizedBox(
                  height: 20,
                ),
                LoginInput(
                    hintText: '请输入密码',
                    obscureText: true,
                    controller: _passwordController),
                SizedBox(
                  height: 20,
                ),
                validateWidget(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CommonButton(
                    '立即登录',
                    () {
                      login();
                    },
                    isHollow: false,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 验证码输入框
  Stack validateWidget() {
    return Stack(
      children: [
        LoginInput(hintText: '请输入验证码', controller: _imgCodeController),
        Positioned.fill(
          child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.only(right: 10),
                child: img == null ? Text('') : Image.memory(img, width: 100),
              )),
        ),
      ],
    );
  }
}
