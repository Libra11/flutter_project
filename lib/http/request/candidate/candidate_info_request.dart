/*
 * @Author: Libra
 * @Date: 2021-11-26 17:48:45
 * @LastEditTime: 2021-11-29 10:10:29
 * @LastEditors: Libra
 * @Description: 获取考生信息
 * @FilePath: /test_flutter/lib/http/request/candidate/candidate_info_request.dart
 */
import 'package:test_flutter/http/request/base_request.dart';

class CandidateInfoRequest extends BaseRequest {
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
    return "/exam/api/candidate/info";
  }
}
