/*
 * @Author: Libra
 * @Date: 2021-12-03 11:11:41
 * @LastEditTime: 2021-12-03 11:11:41
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/provider/job_info.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/model/job_info_model.dart';

class JobInfo extends ChangeNotifier {
  JobInfoModel? _info;
  JobInfoModel? get info => _info;
  void setInfo(info) {
    _info = info;
    notifyListeners();
  }
}
