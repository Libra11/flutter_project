/*
 * @Author: Libra
 * @Date: 2021-12-02 14:35:22
 * @LastEditTime: 2021-12-02 14:37:20
 * @LastEditors: Libra
 * @Description: 更新切片信息
 * @FilePath: /test_flutter/lib/http/request/monitor/update_slice_request.dart
 */
import 'package:test_flutter/http/request/base_request.dart';

class UpdateSliceRequest extends BaseRequest {
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
    return '/exam/api/monitor/slice/upload';
  }
}
