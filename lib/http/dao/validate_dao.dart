/*
 * @Author: Libra
 * @Date: 2021-11-18 10:02:41
 * @LastEditTime: 2021-11-19 09:47:25
 * @LastEditors: Libra
 * @Description: 图片验证码 dao
 * @FilePath: /test_flutter/lib/http/dao/validate_dao.dart
 */
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/http/request/candidate/validate_request.dart';

class ValidateDao {
  static validate() {
    BaseRequest request = ValidateRequest();
    var result = HiNet.instance.fire(request);
    return result;
  }
}
