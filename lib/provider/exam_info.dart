/*
 * @Author: Libra
 * @Date: 2021-11-29 16:47:14
 * @LastEditTime: 2021-11-29 16:47:14
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/provider/exam_info.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/model/exam_info_model.dart';

class ExamInfo extends ChangeNotifier {
  ExamInfoModel? _info;
  ExamInfoModel? get info => _info;
  void setInfo(info) {
    _info = info;
    notifyListeners();
  }
}
