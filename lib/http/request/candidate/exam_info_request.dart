/*
 * @Author: Libra
 * @Date: 2021-11-29 16:45:31
 * @LastEditTime: 2021-11-29 16:45:32
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/http/request/candidate/exam_info_request.dart
 */
import 'package:test_flutter/http/request/base_request.dart';

class ExamInfoRequest extends BaseRequest {
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
    return "/exam/api/exam/info";
  }
}
