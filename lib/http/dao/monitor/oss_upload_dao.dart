/*
 * @Author: Libra
 * @Date: 2021-12-02 15:03:38
 * @LastEditTime: 2021-12-06 18:22:03
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/http/dao/monitor/oss_upload_dao.dart
 */
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/http/request/monitor/oss_upload_request.dart';

class OssUploadDao {
  static ossUpload(String oSSAccessKeyId, String policy, String signature,
      var file, String fileName) async {
    BaseRequest request = OssUploadRequest();
    var formData = FormData.fromMap({
      "name": fileName,
      "key": fileName,
      "OSSAccessKeyId": oSSAccessKeyId,
      "policy": policy,
      "signature": signature,
      "file": file == null
          ? null
          : await MultipartFile.fromFile(file.path, filename: fileName)
    });
    request.addHeader('contentType', 'multipart/form-data');
    request.setFormData(formData);
    var result = await HiNet.instance.fire(request);
    return result;
  }
}
