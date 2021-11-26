/*
 * @Author: Libra
 * @Date: 2021-11-26 16:32:06
 * @LastEditTime: 2021-11-26 16:33:33
 * @LastEditors: Libra
 * @Description: 获取系统时间
 * @FilePath: /test_flutter/lib/http/request/exam/time_request.dart
 */
import 'package:test_flutter/http/request/base_request.dart';

class TimeRequest extends BaseRequest {
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
    return '/exam/api/exam/time';
  }
}
