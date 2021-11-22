/*
 * @Author: Libra
 * @Date: 2021-11-22 11:26:35
 * @LastEditTime: 2021-11-22 15:28:40
 * @LastEditors: Libra
 * @Description: 基本信息页面
 * @FilePath: /test_flutter/lib/pages/base_page.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/widget/common_header.dart';
import 'package:test_flutter/widget/common_layout.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(widget: CommonHeader());
  }
}
