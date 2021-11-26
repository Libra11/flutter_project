/*
 * @Author: Libra
 * @Date: 2021-11-18 09:48:53
 * @LastEditTime: 2021-11-26 11:21:59
 * @LastEditors: Libra
 * @Description: 登录 dao
 * @FilePath: /test_flutter/lib/http/dao/login_dao.dart
 */
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/http/request/candidate/login_request.dart';

class LoginDao {
  static const token = "TOKEN";
  static const storage = FlutterSecureStorage();
  static login(String imageCode, String key, String loginName,
      String loginPassword) async {
    BaseRequest request = LoginRequest();
    request.setParams({
      "imageCode": imageCode,
      "key": key,
      "loginName": loginName,
      "loginPassword": loginPassword
    });
    var result = await HiNet.instance.fire(request);
    result = result.data;
    if (result['code'] == 0 && result['data'] != null) {
      //保存登录令牌
      await storage.write(key: token, value: "Bearer ${result['data']}");
    }
    return result;
  }

  static getToken() async {
    var result = await storage.read(key: token);
    if (result != null) {
      return result;
    } else {
      return null;
    }
  }
}
