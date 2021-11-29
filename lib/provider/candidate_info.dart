/*
 * @Author: Libra
 * @Date: 2021-11-29 10:37:42
 * @LastEditTime: 2021-11-29 10:59:52
 * @LastEditors: Libra
 * @Description: 考生用户信息
 * @FilePath: /test_flutter/lib/provider/candidate_info.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/model/candidate_info_model.dart';

class CandidateInfo extends ChangeNotifier {
  CandidateInfoModel? _info;
  CandidateInfoModel? get info => _info;
  void setInfo(info) {
    _info = info;
    notifyListeners();
  }
}
