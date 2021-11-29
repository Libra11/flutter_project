/*
 * @Author: Libra
 * @Date: 2021-11-16 14:28:42
 * @LastEditTime: 2021-11-29 10:07:43
 * @LastEditors: Libra
 * @Description: 网络请求
 * @FilePath: /test_flutter/lib/http/core/hi_net.dart
 */
import 'package:test_flutter/http/core/dio_adapter.dart';
import 'package:test_flutter/http/core/hi_error.dart';
import 'package:test_flutter/http/core/hi_net_adapter.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/main.dart';
import 'package:test_flutter/util/toast.dart';

class HiNet {
  HiNet._();
  // 单例
  static HiNet? _instance;
  static get instance => _instance ?? HiNet._();

  Future<dynamic> fire(BaseRequest request) async {
    HiNetResponse response;
    response = await send(request);
    var result = response.data;
    var message = response.msg;
    var code = response.code;
    switch (code) {
      case 0:
        return response;
      // 登录失效
      case 1005:
        delegate.push(name: '/login');
        ToastUtil.showToast('出错了：$message');
        throw NeedLoginError(code, '出错了：$message');
      // JWT 失效
      case 1032:
        delegate.push(name: '/login');
        ToastUtil.showToast('出错了：$message');
        throw NeedLoginError(code, '出错了：$message');
      default:
        throw HiNetError(code, '出错了：$message', data: result);
    }
  }

  // 发送网络请求
  Future<HiNetResponse> send(BaseRequest request) {
    HiNetAdapter adapter = DioAdapter();
    return adapter.send(request);
  }
}
