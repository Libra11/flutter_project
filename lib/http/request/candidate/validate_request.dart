/*
 * @Author: Libra
 * @Date: 2021-11-18 09:57:26
 * @LastEditTime: 2021-11-18 10:14:44
 * @LastEditors: Libra
 * @Description: 图片验证码请求
 * @FilePath: /test_flutter/lib/http/request/candidate/validate_request.dart
 */
import 'package:test_flutter/http/request/base_request.dart';

class ValidateRequest extends BaseRequest {
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
