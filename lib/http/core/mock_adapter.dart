/*
 * @Author: Libra
 * @Date: 2021-11-17 10:47:47
 * @LastEditTime: 2021-11-17 16:00:59
 * @LastEditors: Libra
 * @Description: mock 适配器
 * @FilePath: /test_flutter/lib/http/core/mock_adapter.dart
 */
import 'package:test_flutter/http/core/hi_net_adapter.dart';
import 'package:test_flutter/http/request/base_request.dart';

class MockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse> send(BaseRequest request) {
    return Future.delayed(Duration(seconds: 1), () {
      return HiNetResponse(0, data: 'ddd', msg: "success");
    });
  }
}
