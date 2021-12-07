/*
 * @Author: Libra
 * @Date: 2021-12-07 10:46:48
 * @LastEditTime: 2021-12-07 10:47:59
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/http/dao/exam/start_exam_dao.dart
 */
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/http/request/exam/start_exam_request.dart';

class StartExamDao {
  static startExam() async {
    BaseRequest request = StartExamRequest();
    var result = await HiNet.instance.fire(request);
    return result;
  }
}
