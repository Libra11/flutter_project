/*
 * @Author: Libra
 * @Date: 2021-11-26 16:35:46
 * @LastEditTime: 2021-11-26 16:37:02
 * @LastEditors: Libra
 * @Description: Time dao
 * @FilePath: /test_flutter/lib/http/dao/time_dao.dart
 */
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/http/request/exam/time_request.dart';

class TimeDao {
  static getTime() {
    BaseRequest request = TimeRequest();
    var result = HiNet.instance.fire(request);
    return result;
  }
}
