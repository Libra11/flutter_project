/*
 * @Author: Libra
 * @Date: 2021-12-02 14:42:45
 * @LastEditTime: 2021-12-02 19:08:36
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/http/dao/monitor/update_slice_dao.dart
 */
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/http/request/monitor/update_slice_request.dart';

class UpdateSliceDao {
  static updateSlice(String? candidateUuid, String? examUuid, String name,
      String path, String type) async {
    BaseRequest request = UpdateSliceRequest();
    request.setParams({
      "candidateUuid": candidateUuid,
      "examUuid": examUuid,
      "name": name,
      "path": path,
      "type": type
    });
    var result = await HiNet.instance.fire(request);
    return result;
  }
}
