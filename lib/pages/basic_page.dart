/*
 * @Author: Libra
 * @Date: 2021-11-22 11:26:35
 * @LastEditTime: 2021-11-26 16:38:44
 * @LastEditors: Libra
 * @Description: 基本信息页面
 * @FilePath: /test_flutter/lib/pages/basic_page.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/http/dao/time_dao.dart';
import 'package:test_flutter/widget/common_header.dart';
import 'package:test_flutter/widget/common_layout.dart';

class BasicPage extends StatefulWidget {
  const BasicPage({Key? key}) : super(key: key);

  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  void getTime() {
    TimeDao.getTime().then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
        widget: Column(children: <Widget>[
      CommonHeader(),
      TextButton(
        child: Text('获取时间'),
        onPressed: getTime,
      ),
    ]));
  }
}
