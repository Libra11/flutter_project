/*
 * @Author: Libra
 * @Date: 2021-12-06 19:08:08
 * @LastEditTime: 2021-12-07 10:50:42
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/pages/notice_page.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/http/core/hi_error.dart';
import 'package:test_flutter/http/dao/exam/start_exam_dao.dart';
import 'package:test_flutter/main.dart';
import 'package:test_flutter/util/color.dart';
import 'package:test_flutter/util/font.dart';
import 'package:test_flutter/util/toast.dart';
import 'package:test_flutter/widget/common_button.dart';
import 'package:test_flutter/widget/common_header.dart';
import 'package:test_flutter/widget/common_layout.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  bool? _checkboxSelected = true;
  int startTime = 10;

  // 倒计时
  void _startCountDown() {
    setState(() {
      startTime--;
    });
    if (startTime > 0) {
      Future.delayed(Duration(seconds: 1), () {
        _startCountDown();
      });
    }
  }

  // 开始作答
  void _startAnswer() async {
    try {
      await StartExamDao.startExam();
      delegate.push(name: '/exam');
    } on HiNetError catch (e) {
      ToastUtil.showToast(e.message);
    }
  }

  @override
  void initState() {
    _startCountDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      widget: Column(
        children: <Widget>[
          CommonHeader(),
          SizedBox(height: 20),
          Center(
            child: Text('* 为保证顺利，我们需要做一些约定', style: fsp12),
          ),
          SizedBox(height: 10),
          Center(
            child: Text('在线考试须知', style: fs20),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('考试纪律', style: fsr17),
                  SizedBox(height: 10),
                  Text(
                      '考试过程中请不要使用QQ，微信等im软件即手机交流信息，不要佩戴耳机，按系统要求开启摄像头，对准面部，禁止替考',
                      style: fs13),
                  SizedBox(height: 20),
                  Text('作弊说明', style: fsr17),
                  SizedBox(height: 10),
                  Text(
                      '考试过程中请不要使用QQ，微信等im软件即手机交流信息，不要佩戴耳机，按系统要求开启摄像头，对准面部，禁止替考',
                      style: fs13),
                  SizedBox(height: 20),
                  Text('作弊说明', style: fsr17),
                  SizedBox(height: 10),
                  Text(
                      '考试过程中请不要使用QQ，微信等im软件即手机交流信息，不要佩戴耳机，按系统要求开启摄像头，对准面部，禁止替考',
                      style: fs13),
                  SizedBox(height: 20),
                  Flex(direction: Axis.horizontal, children: <Widget>[
                    Checkbox(
                      value: _checkboxSelected,
                      activeColor: redColor,
                      onChanged: (value) {
                        setState(() {
                          _checkboxSelected = value;
                        });
                      },
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('我同意，并承诺题目有个人独立完成，大体重不会获取网络，书记，他人的帮助。',
                          style: fsler13),
                    ),
                  ]),
                  SizedBox(height: 20),
                  Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CommonButton('上一步', () {
                          delegate.push(name: '/camera');
                        }, width: 150, height: 40),
                        CommonButton(
                            '开始作答${startTime == 0 ? '' : '（$startTime）'}',
                            startTime == 0 ? _startAnswer : null,
                            isHollow: false,
                            width: 150,
                            height: 40),
                      ])
                ]),
          )
        ],
      ),
    );
  }
}
