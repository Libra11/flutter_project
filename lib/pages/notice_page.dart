/*
 * @Author: Libra
 * @Date: 2021-12-06 19:08:08
 * @LastEditTime: 2021-12-06 19:12:10
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/pages/notice_page.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/widget/common_header.dart';
import 'package:test_flutter/widget/common_layout.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      widget: Column(
        children: const <Widget>[CommonHeader()],
      ),
    );
  }
}
