/*
 * @Author: Libra
 * @Date: 2021-11-29 16:45:58
 * @LastEditTime: 2021-12-03 11:33:15
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/http/dao/exam/exam_info_dao.dart
 */
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/http/request/exam/exam_info_request.dart';
import 'package:test_flutter/model/exam_info_model.dart';

class ExamInfoDao {
  static getExamInfo() async {
    BaseRequest request = ExamInfoRequest();
    var result = await HiNet.instance.fire(request);
    return ExamInfoModel.fromJson(result.data['data']);
  }
}
