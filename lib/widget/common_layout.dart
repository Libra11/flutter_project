/*
 * @Author: Libra
 * @Date: 2021-11-22 13:58:00
 * @LastEditTime: 2021-11-22 15:33:12
 * @LastEditors: Libra
 * @Description: 通用 layout 组件
 * @FilePath: /test_flutter/lib/widget/common_layout.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/util/color.dart';

class CommonLayout extends StatelessWidget {
  final bool hasLogo;
  final Widget? widget;
  const CommonLayout({this.widget, this.hasLogo = false, Key? key})
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
                  "滴滴2021校园招聘在线考试",
                  style: TextStyle(color: Colors.black),
                )),
        body: widget);
  }
}
