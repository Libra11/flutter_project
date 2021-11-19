/*
 * @Author: Libra
 * @Date: 2021-11-16 14:10:54
 * @LastEditTime: 2021-11-17 17:05:36
 * @LastEditors: Libra
 * @Description: 测试 request
 * @FilePath: /test_flutter/lib/http/request/test_request.dart
 */
import 'package:test_flutter/http/request/base_request.dart';

class TestRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return '/exam/api/candidate/validate_code';
  }
}
