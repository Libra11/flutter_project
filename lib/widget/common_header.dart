/*
 * @Author: Libra
 * @Date: 2021-11-22 15:25:16
 * @LastEditTime: 2021-11-22 16:28:36
 * @LastEditors: Libra
 * @Description: 通用 header 组件
 * @FilePath: /test_flutter/lib/widget/common_header.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/util/color.dart';
import 'package:test_flutter/util/font.dart';

class CommonHeader extends StatelessWidget {
  // 是否正在作答
  final bool isAnswering;
  const CommonHeader({this.isAnswering = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: primary,
                border: Border(
                  right: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
              ),
              width: 112,
              height: 60,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      '距离考试计时',
                      style: fsw12,
                    ),
                    Text('00:00:00', style: TextStyle(color: Colors.white))
                  ])),
          isAnswering
              ? Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text('全部考题', style: fsw12),
                        SizedBox(width: 5),
                        Icon(
                          Icons.expand_more,
                          color: Colors.white,
                          size: 14,
                        )
                      ]))
              : Container(
                  padding: EdgeInsets.only(right: 10),
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('欢迎你，张三', style: fsw12),
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.logout,
                            size: 12,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text('退出', style: fsw12)
                        ],
                      )
                    ],
                  )),
        ],
      ),
    );
  }
}
