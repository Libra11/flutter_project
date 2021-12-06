/*
 * @Author: Libra
 * @Date: 2021-12-06 17:53:16
 * @LastEditTime: 2021-12-06 18:06:36
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/http/dao/candidate/avatar_update_dao.dart
 */
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/http/request/candidate/avatar_update_request.dart';

class AvatarUpdateDao {
  static avatarUpdate(String path) async {
    BaseRequest request = AvatarUpdateRequest();
    request.setParams({
      "path": path,
    });
    var result = await HiNet.instance.fire(request);
    result = result.data;
    return result;
  }
}
