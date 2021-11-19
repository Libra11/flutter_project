/*
 * @Author: Libra
 * @Date: 2021-11-16 16:05:04
 * @LastEditTime: 2021-11-17 17:36:52
 * @LastEditors: Libra
 * @Description: 统一网络层返回格式&网络请求抽象类
 * @FilePath: /test_flutter/lib/http/core/hi_net_adapter.dart
 */
import 'dart:convert';

import 'package:test_flutter/http/request/base_request.dart';

class HiNetResponse {
  HiNetResponse(this.code, {this.msg, this.data});

  int? code;
  String? msg;
  dynamic data;

  @override
  String toString() {
    return data is Map ? json.encode(data) : data.toString();
  }
}

abstract class HiNetAdapter {
  Future<HiNetResponse> send(BaseRequest request);
}
