/*
 * @Author: Libra
 * @Date: 2021-12-02 14:41:16
 * @LastEditTime: 2021-12-02 15:33:31
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/http/dao/monitor/get_token_dao.dart
 */
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/http/request/monitor/get_token_request.dart';
import 'package:test_flutter/model/token_model.dart';

class GetTokenDao {
  static getToken() async {
    BaseRequest request = GetTokenRequest();
    var result = await HiNet.instance.fire(request);
    return Token.fromJson(result.data['data']);
  }
}
