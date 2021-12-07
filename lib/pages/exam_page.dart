/*
 * @Author: Libra
 * @Date: 2021-12-07 10:51:49
 * @LastEditTime: 2021-12-07 10:52:59
 * @LastEditors: Libra
 * @Description: 试卷列表页
 * @FilePath: /test_flutter/lib/pages/exam_page.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/widget/common_header.dart';
import 'package:test_flutter/widget/common_layout.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      widget: Column(
        children: const <Widget>[CommonHeader()],
      ),
    );
  }
}
