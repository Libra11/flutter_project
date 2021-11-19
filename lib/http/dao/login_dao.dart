/*
 * @Author: Libra
 * @Date: 2021-11-18 09:48:53
 * @LastEditTime: 2021-11-18 17:15:02
 * @LastEditors: Libra
 * @Description: 登录 dao
 * @FilePath: /test_flutter/lib/http/dao/login_dao.dart
 */
import 'package:test_flutter/http/core/hi_error.dart';
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/http/request/candidate/login_request.dart';

class LoginDao {
  static login(
      String imageCode, String key, String loginName, String loginPassword) {
    BaseRequest request = LoginRequest();
    request.setParams({
      "imageCode": imageCode,
      "key": key,
      "loginName": loginName,
      "loginPassword": loginPassword
    });
    var result = HiNet.instance.fire(request);
    return result;
  }
}
