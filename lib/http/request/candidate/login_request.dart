/*
 * @Author: Libra
 * @Date: 2021-11-18 09:43:21
 * @LastEditTime: 2021-11-18 16:46:03
 * @LastEditors: Libra
 * @Description: 登录请求
 * @FilePath: /test_flutter/lib/http/request/candidate/login_request.dart
 */
import 'package:test_flutter/http/request/base_request.dart';

class LoginRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return '/exam/api/candidate/login';
  }
}
