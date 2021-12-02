/*
 * @Author: Libra
 * @Date: 2021-12-02 14:32:00
 * @LastEditTime: 2021-12-02 14:38:00
 * @LastEditors: Libra
 * @Description: 获取 TOKEN
 * @FilePath: /test_flutter/lib/http/request/monitor/get_token_request.dart
 */
import 'package:test_flutter/http/request/base_request.dart';

class GetTokenRequest extends BaseRequest {
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
    return '/exam/api/monitor/oss/exam/token';
  }
}
