/*
 * @Author: Libra
 * @Date: 2021-12-07 10:42:48
 * @LastEditTime: 2021-12-07 10:46:21
 * @LastEditors: Libra
 * @Description: 开始考试
 * @FilePath: /test_flutter/lib/http/request/exam/start_exam_request.dart
 */
import 'package:test_flutter/http/request/base_request.dart';

class StartExamRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return "/exam/api/exam/start";
  }
}
