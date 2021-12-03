/*
 * @Author: Libra
 * @Date: 2021-11-22 13:58:00
 * @LastEditTime: 2021-12-03 11:25:34
 * @LastEditors: Libra
 * @Description: 通用 layout 组件
 * @FilePath: /test_flutter/lib/widget/common_layout.dart
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/provider/exam_info.dart';
import 'package:test_flutter/provider/job_info.dart';
import 'package:test_flutter/util/color.dart';
import 'package:test_flutter/util/font.dart';

class CommonLayout extends StatelessWidget {
  final bool hasLogo;
  final Widget? widget;
  final String? title;
  const CommonLayout({this.widget, this.hasLogo = false, Key? key, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: hasLogo
            ? AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                toolbarHeight: 88,
                elevation: 34,
                shadowColor: shadowColor2,
                title: SizedBox(
                  height: 54,
                  child: Image.asset('assets/logo_igp.png'),
                ),
              )
            : AppBar(
                backgroundColor: Colors.white,
                elevation: 34,
                shadowColor: shadowColor2,
                title: Text(
                  title ?? '滴滴2021校园招聘在线考试',
                  style: fs24,
                )),
        body: widget);
  }
}
