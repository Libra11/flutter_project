/*
 * @Author: Libra
 * @Date: 2021-12-07 11:05:01
 * @LastEditTime: 2021-12-07 11:06:36
 * @LastEditors: Libra
 * @Description: 获取试卷列表
 * @FilePath: /test_flutter/lib/http/request/exam/get_paper_list_request.dart
 */
import 'package:test_flutter/http/request/base_request.dart';

class GetPaperListRequest extends BaseRequest {
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
    return "/exam/api/exam/part/list";
  }
}
