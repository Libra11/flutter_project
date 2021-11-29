/*
 * @Author: Libra
 * @Date: 2021-11-22 15:25:16
 * @LastEditTime: 2021-11-29 15:55:08
 * @LastEditors: Libra
 * @Description: 通用 header 组件
 * @FilePath: /test_flutter/lib/widget/common_header.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/http/dao/login_dao.dart';
import 'package:test_flutter/http/dao/time_dao.dart';
import 'package:test_flutter/main.dart';
import 'package:test_flutter/provider/candidate_info.dart';
import 'package:test_flutter/util/color.dart';
import 'package:test_flutter/util/font.dart';

class CommonHeader extends StatelessWidget {
  // 是否正在作答
  final bool isAnswering;

  const CommonHeader({this.isAnswering = false, Key? key}) : super(key: key);

  void logOut() async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: LoginDao.token);
    delegate.push(name: '/login');
  }

  void getTime() async {
    var time = await TimeDao.getTime();
    print(time);
  }

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
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text('欢迎你，', style: fsw12),
                        Consumer<CandidateInfo>(
                          builder: (context, cart, child) {
                            return Text(cart.info?.realName ?? '',
                                style: fsw12);
                          },
                        ),
                      ]),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.logout,
                            size: 12,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            child: Text('退出', style: fsp12),
                            onTap: logOut,
                          )
                        ],
                      )
                    ],
                  )),
        ],
      ),
    );
  }
}
