/*
 * @Author: Libra
 * @Date: 2021-11-15 14:00:13
 * @LastEditTime: 2021-11-18 16:25:57
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/main.dart
 */
import 'dart:convert';
import 'dart:typed_data';

import "package:flutter/material.dart";
import 'package:test_flutter/db/hi_cache.dart';
import 'package:test_flutter/http/core/hi_error.dart';
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/dao/login_dao.dart';
import 'package:test_flutter/http/dao/validate_dao.dart';
import 'package:test_flutter/http/request/candidate/validate_request.dart';
import 'package:test_flutter/http/request/test_request.dart';
import 'package:test_flutter/log/log.dart';
import 'package:test_flutter/pages/login_page.dart';
import 'package:test_flutter/util/color.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var img;
  var key;
  @override
  void initState() {
    super.initState();
    HiCache.preInit();
  }

  void test() async {
    var res = await ValidateDao.validate();
    String validateCode = res['data']['imageCode'];
    key = res['data']['key'];
    validateCode = validateCode.split(',')[1];
    img = Base64Decoder().convert(validateCode);
    setState(() {
      img;
      key;
    });
  }

  test2() async {
    // var res = await LoginDao.login();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 88,
          elevation: 34,
          shadowColor: shadowColor2,
          title: SizedBox(
            height: 54,
            child: Image.asset('assets/logo_igp.png'),
          ),
        ),
        body: LoginPage(),
      ),
    );
  }
}
