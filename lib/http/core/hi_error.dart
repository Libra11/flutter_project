/*
 * @Author: Libra
 * @Date: 2021-11-16 15:56:01
 * @LastEditTime: 2021-11-26 11:55:54
 * @LastEditors: Libra
 * @Description: 网络异常统一格式类
 * @FilePath: /test_flutter/lib/http/core/hi_error.dart
 */
// 网络异常基类

class NeedLoginError extends HiNetError {
  NeedLoginError(int? code, String message) : super(code, message);
}

class HiNetError implements Exception {
  final int? code;
  final String message;
  final dynamic data;

  HiNetError(this.code, this.message, {this.data});
}
