/*
 * @Author: Libra
 * @Date: 2021-11-22 11:26:35
 * @LastEditTime: 2021-12-06 12:54:31
 * @LastEditors: Libra
 * @Description: 基本信息页面
 * @FilePath: /test_flutter/lib/pages/basic_page.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/http/core/hi_error.dart';
import 'package:test_flutter/http/dao/candidate/candidate_info_dao.dart';
import 'package:test_flutter/http/dao/candidate/update_candidate_info_dao.dart';
import 'package:test_flutter/http/dao/exam/exam_info_dao.dart';
import 'package:test_flutter/util/font.dart';
import 'package:test_flutter/util/toast.dart';
import 'package:test_flutter/widget/common_button.dart';
import 'package:test_flutter/widget/common_header.dart';
import 'package:test_flutter/widget/common_layout.dart';
import 'package:test_flutter/widget/input.dart';

class BasicPage extends StatefulWidget {
  const BasicPage({Key? key}) : super(key: key);

  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  String? realName;
  String? idCardNum;
  String? mobile;
  String? email;
  String? degree;
  String? university;
  String? major;

  @override
  void initState() {
    super.initState();
  }

  // 生成表单
  Future<Widget> generateForm() async {
    var examInfo = await ExamInfoDao.getExamInfo();
    var candidateInfo = await CandidateInfoDao.getCandidateInfo();
    realName = candidateInfo.realName;
    idCardNum = candidateInfo.idCardNum;
    mobile = candidateInfo.mobile;
    email = candidateInfo.email;
    degree = candidateInfo.degree;
    university = candidateInfo.university;
    major = candidateInfo.major;
    TextEditingController _realNameController =
        TextEditingController(text: realName);
    TextEditingController _degreeController =
        TextEditingController(text: degree);
    TextEditingController _mailController = TextEditingController(text: email);
    TextEditingController _mobileController =
        TextEditingController(text: mobile);
    TextEditingController _univerityController =
        TextEditingController(text: university);
    TextEditingController _majorController = TextEditingController(text: major);
    TextEditingController _idCardNumController =
        TextEditingController(text: idCardNum);
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
          },
          onChanged: (val) {
            realName = val;
          },
        ));
      }
      if (info.isEmailRequired) {
        children.add(Input(
          controller: _mailController,
          labelText: "邮箱",
          hintText: "请输入邮箱",
          validator: (v) {
            return v!.trim().isNotEmpty ? null : "邮箱不能为空";
          },
          onChanged: (val) {
            email = val;
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
          onChanged: (val) {
            major = val;
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
          onChanged: (val) {
            degree = val;
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
          onChanged: (val) {
            university = val;
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
          onChanged: (val) {
            mobile = val;
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
          onChanged: (val) {
            idCardNum = val;
          },
        ));
      }
    }
    return Form(
        child: Column(
      children: children,
    ));
  }

  // 更新考生信息
  updateCandidateInfo() async {
    try {
      await UpdateCandidateInfoDao.updateCandidateInfo(
          degree, idCardNum, major, realName, mobile, university, email);
    } on HiNetError catch (e) {
      ToastUtil.showToast(e.message);
    }
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
                    Center(
                        child: Column(children: const [
                      SizedBox(height: 40),
                      Text(
                        "个人信息",
                        style: fsl22,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "请您仔细核对，否则将会影响后续环节",
                        style: fsp12,
                      ),
                      SizedBox(height: 20),
                    ])),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: snapshot.data,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: CommonButton(
                        '保存并下一步',
                        updateCandidateInfo,
                        isHollow: true,
                      ),
                    )
                  ]),
                );
              } else {
                return Container();
              }
            }));
  }
}
