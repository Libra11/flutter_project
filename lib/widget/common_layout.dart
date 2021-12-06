/*
 * @Author: Libra
 * @Date: 2021-11-22 13:58:00
 * @LastEditTime: 2021-12-06 12:01:34
 * @LastEditors: Libra
 * @Description: 通用 layout 组件
 * @FilePath: /test_flutter/lib/widget/common_layout.dart
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/http/core/hi_error.dart';
import 'package:test_flutter/http/dao/candidate/candidate_info_dao.dart';
import 'package:test_flutter/http/dao/exam/exam_info_dao.dart';
import 'package:test_flutter/http/dao/exam/job_info_dao.dart';
import 'package:test_flutter/provider/candidate_info.dart';
import 'package:test_flutter/provider/exam_info.dart';
import 'package:test_flutter/provider/job_info.dart';
import 'package:test_flutter/util/color.dart';
import 'package:test_flutter/util/font.dart';
import 'package:test_flutter/util/toast.dart';

class CommonLayout extends StatefulWidget {
  final bool hasLogo;
  final Widget? widget;
  final String? title;
  final bool isLogin;
  const CommonLayout(
      {this.widget,
      this.hasLogo = false,
      Key? key,
      this.title,
      this.isLogin = true})
      : super(key: key);

  @override
  State<CommonLayout> createState() => _CommonLayoutState();
}

class _CommonLayoutState extends State<CommonLayout> {
  String userExamName = '';
  String name = '';
  @override
  void initState() {
    if (widget.isLogin) {
      getCandidateInfo();
      getExamInfo();
      getJobInfo();
    }
    super.initState();
  }

  void getExamInfo() async {
    try {
      var examInfo = await ExamInfoDao.getExamInfo();
      Provider.of<ExamInfo>(context, listen: false).setInfo(examInfo);
      setState(() {
        userExamName = examInfo.userExamName;
      });
    } on HiNetError catch (e) {
      ToastUtil.showToast(e.message);
    }
  }

  void getJobInfo() async {
    try {
      var jobInfo = await JobInfoDao.getJobInfo();
      Provider.of<JobInfo>(context, listen: false).setInfo(jobInfo);
      setState(() {
        name = jobInfo.name;
      });
    } on HiNetError catch (e) {
      ToastUtil.showToast(e.message);
    }
  }

  void getCandidateInfo() async {
    try {
      var candidateInfo = await CandidateInfoDao.getCandidateInfo();
      Provider.of<CandidateInfo>(context, listen: false).setInfo(candidateInfo);
    } on HiNetError catch (e) {
      ToastUtil.showToast(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: widget.hasLogo
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
                centerTitle: true,
                title: Text(
                  widget.title ?? '$userExamName$name',
                  style: fs24,
                )),
        body: widget.widget);
  }
}
