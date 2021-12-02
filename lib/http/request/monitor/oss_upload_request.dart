/*
 * @Author: Libra
 * @Date: 2021-12-02 14:26:59
 * @LastEditTime: 2021-12-02 16:32:38
 * @LastEditors: Libra
 * @Description: 上传 OSS
 * @FilePath: /test_flutter/lib/http/request/monitor/oss_upload_request.dart
 */
import 'package:test_flutter/http/request/base_request.dart';

class OssUploadRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  bool isFormData() {
    return true;
  }

  @override
  String path() {
    return "";
  }
}
