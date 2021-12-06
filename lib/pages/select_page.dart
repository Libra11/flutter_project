/*
 * @Author: Libra
 * @Date: 2021-12-06 11:12:39
 * @LastEditTime: 2021-12-06 11:17:45
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/pages/select_page.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/main.dart';
import 'package:test_flutter/widget/common_layout.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      widget: Center(
        child: Column(
          children: <Widget>[
            TextButton(
                onPressed: () {
                  delegate.push(name: '/basic');
                },
                child: Text('去考试')),
            TextButton(
                onPressed: () {
                  delegate.push(name: '/test');
                },
                child: Text('去监控')),
          ],
        ),
      ),
    );
  }
}
