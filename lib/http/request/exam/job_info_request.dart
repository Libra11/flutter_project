/*
 * @Author: Libra
 * @Date: 2021-12-03 11:07:05
 * @LastEditTime: 2021-12-03 13:42:05
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/http/request/exam/job_info_request.dart
 */
import 'package:test_flutter/http/request/base_request.dart';

class JobInfoRequest extends BaseRequest {
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
    return "/exam/api/exam/job/info";
  }
}
