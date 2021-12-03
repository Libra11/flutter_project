/*
 * @Author: Libra
 * @Date: 2021-11-22 11:26:35
 * @LastEditTime: 2021-12-03 16:46:15
 * @LastEditors: Libra
 * @Description: 基本信息页面
 * @FilePath: /test_flutter/lib/pages/basic_page.dart
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/http/dao/candidate_info_dao.dart';
import 'package:test_flutter/http/dao/exam/exam_info_dao.dart';
import 'package:test_flutter/main.dart';
import 'package:test_flutter/model/candidate_info_model.dart';
import 'package:test_flutter/model/exam_info_model.dart';
import 'package:test_flutter/provider/candidate_info.dart';
import 'package:test_flutter/provider/exam_info.dart';
import 'package:test_flutter/provider/job_info.dart';
import 'package:test_flutter/widget/common_header.dart';
import 'package:test_flutter/widget/common_layout.dart';
import 'package:test_flutter/widget/input.dart';

class BasicPage extends StatefulWidget {
  const BasicPage({Key? key}) : super(key: key);

  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  @override
  void initState() {
    super.initState();
  }

  // 生成表单
  Future<Widget> generateForm() async {
    var examInfo = await ExamInfoDao.getExamInfo();
    var candidateInfo = await CandidateInfoDao.getCandidateInfo();
    TextEditingController _realNameController =
        TextEditingController(text: candidateInfo.realName);
    TextEditingController _degreeController =
        TextEditingController(text: candidateInfo.degree);
    TextEditingController _mailController =
        TextEditingController(text: candidateInfo.email);
    TextEditingController _mobileController =
        TextEditingController(text: candidateInfo.mobile);
    TextEditingController _univerityController =
        TextEditingController(text: candidateInfo.university);
    TextEditingController _majorController =
        TextEditingController(text: candidateInfo.major);
    TextEditingController _idCardNumController =
        TextEditingController(text: candidateInfo.idCardNum);
    List<Widget> children = [];
    var info = examInfo.candidateInfo;
    if (info != null) {
      if (info.isRealNameRequired) {
        children.add(Input(
            controller: _realNameController,
            labelText: "姓名",
            hintText: "请输入姓名",
            validator: (v) {
              return v!.trim().isNotEmpty ? null : "用户名不能为空";
            }));
      }
      if (info.isEmailRequired) {
        children.add(Input(
          controller: _mailController,
          labelText: "邮箱",
          hintText: "请输入邮箱",
          validator: (v) {
            return v!.trim().isNotEmpty ? null : "邮箱不能为空";
          },
        ));
      }
      if (info.isMajorRequired) {
        children.add(Input(
          controller: _majorController,
          labelText: "专业",
          hintText: "请输入专业",
          validator: (v) {
            return v!.trim().isNotEmpty ? null : "专业不能为空";
          },
        ));
      }
      if (info.isDegreeRequired) {
        children.add(Input(
          controller: _degreeController,
          labelText: "学历",
          hintText: "请输入学历",
          validator: (v) {
            return v!.trim().isNotEmpty ? null : "学历不能为空";
          },
        ));
      }
      if (info.isUniversityRequired) {
        children.add(Input(
          controller: _univerityController,
          labelText: "学校",
          hintText: "请输入学校",
          validator: (v) {
            return v!.trim().isNotEmpty ? null : "学校不能为空";
          },
        ));
      }
      if (info.isMobileRequired) {
        children.add(Input(
          controller: _mobileController,
          labelText: "手机号",
          hintText: "请输入手机号",
          validator: (v) {
            return v!.trim().isNotEmpty ? null : "手机号不能为空";
          },
        ));
      }
      if (info.isIdCardNumRequired) {
        children.add(Input(
          controller: _idCardNumController,
          labelText: "身份证号",
          hintText: "请输入身份证号",
          validator: (v) {
            return v!.trim().isNotEmpty ? null : "身份证号不能为空";
          },
        ));
      }
    }
    return Form(
        child: Column(
      children: children,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
        widget: FutureBuilder(
            future: generateForm(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(children: <Widget>[
                    CommonHeader(),
                    TextButton(
                        onPressed: () {
                          delegate.push(name: '/test');
                        },
                        child: Text('去录制页面')),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: snapshot.data,
                    ),
                  ]),
                );
              } else {
                return Container();
              }
            }));
  }
}
