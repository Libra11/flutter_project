/*
 * @Author: Libra
 * @Date: 2021-11-22 11:26:35
 * @LastEditTime: 2021-12-03 14:13:08
 * @LastEditors: Libra
 * @Description: 基本信息页面
 * @FilePath: /test_flutter/lib/pages/basic_page.dart
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/main.dart';
import 'package:test_flutter/provider/exam_info.dart';
import 'package:test_flutter/provider/job_info.dart';
import 'package:test_flutter/widget/common_header.dart';
import 'package:test_flutter/widget/common_layout.dart';

class BasicPage extends StatefulWidget {
  const BasicPage({Key? key}) : super(key: key);

  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
        widget: Column(children: <Widget>[
      CommonHeader(),
      TextButton(
          onPressed: () {
            delegate.push(name: '/test');
          },
          child: Text('去录制页面')),
    ]));
  }
}
