/*
 * @Author: Libra
 * @Date: 2021-12-06 17:50:45
 * @LastEditTime: 2021-12-06 17:52:40
 * @LastEditors: Libra
 * @Description: 更新头像
 * @FilePath: /test_flutter/lib/http/request/candidate/avatar_update_request.dart
 */
import 'package:test_flutter/http/request/base_request.dart';

class AvatarUpdateRequest extends BaseRequest {
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
    return '/exam/api/candidate/avatar/change';
  }
}
