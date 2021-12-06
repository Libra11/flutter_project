/*
 * @Author: Libra
 * @Date: 2021-12-06 11:57:49
 * @LastEditTime: 2021-12-06 12:00:11
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/http/request/candidate/update_candidate_info_request.dart
 */
import 'package:test_flutter/http/request/base_request.dart';

class UpdateCandidateInfoRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return "/exam/api/candidate/update";
  }
}
