/*
 * @Author: Libra
 * @Date: 2021-11-15 14:00:13
 * @LastEditTime: 2021-11-22 13:17:09
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/main.dart
 */
import "package:flutter/material.dart";
import 'package:test_flutter/router/delegate.dart';

MyRouterDelegate delegate = MyRouterDelegate();

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key) {
    // 初始化时添加第一个页面
    delegate.push(name: '/login');
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', home: Router(routerDelegate: delegate));
  }
}
