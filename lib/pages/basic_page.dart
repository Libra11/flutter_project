/*
 * @Author: Libra
 * @Date: 2021-11-22 11:26:35
 * @LastEditTime: 2021-12-02 14:22:44
 * @LastEditors: Libra
 * @Description: 基本信息页面
 * @FilePath: /test_flutter/lib/pages/basic_page.dart
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/http/core/hi_error.dart';
import 'package:test_flutter/http/dao/candidate_info_dao.dart';
import 'package:test_flutter/main.dart';
import 'package:test_flutter/provider/candidate_info.dart';
import 'package:test_flutter/util/toast.dart';
import 'package:test_flutter/widget/common_header.dart';
import 'package:test_flutter/widget/common_layout.dart';

class BasicPage extends StatefulWidget {
  const BasicPage({Key? key}) : super(key: key);

  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  @override
  void initState() {
    getCandidateInfo();
    super.initState();
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
    return CommonLayout(
        widget: Column(children: <Widget>[
      CommonHeader(),
      TextButton(
          onPressed: () {
            delegate.push(name: '/test');
          },
          child: Text('去录制页面')),
    ]));
  }
}
