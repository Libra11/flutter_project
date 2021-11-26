// ignore_for_file: constant_identifier_names

/*
 * @Author: Libra
 * @Date: 2021-11-16 13:37:09
 * @LastEditTime: 2021-11-22 17:11:09
 * @LastEditors: Libra
 * @Description: request 基类
 * @FilePath: /test_flutter/lib/http/request/base_request.dart
 */
import 'package:test_flutter/http/dao/login_dao.dart';

enum HttpMethod { GET, POST, DELETE }

// 基础请求
abstract class BaseRequest {
  String? pathParams;
  // 是否使用 https
  bool useHttps = true;
  // 请求域名
  String authority() {
    return 'test-api.stac.fun';
  }

  // 请求方法
  HttpMethod httpMethod();
  // 请求 Path
  String path();
  String url() {
    Uri uri;
    var pathStr = path();
    // 拼接 path 参数
    if (pathParams != null) {
      pathStr =
          path().endsWith('/') ? "$pathStr$pathParams" : "$pathStr/$pathParams";
    }
    // http 和 https 的切换
    uri = useHttps
        ? Uri.https(authority(), pathStr, params)
        : Uri.http(authority(), pathStr, params);
    // 添加 headers
    if (needLogin()) {
      //给需要登录的接口携带登录令牌
      addHeader(LoginDao.token, LoginDao.getToken());
    }
    return uri.toString();
  }

  // 是否需要登录
  bool needLogin();

  Map<String, dynamic> params = {};
  // 设置参数
  BaseRequest setParams(Map<String, dynamic> params) {
    this.params = params;
    return this;
  }

  Map<String, dynamic> header = {};
  // 添加header
  BaseRequest addHeader(String key, dynamic value) {
    header[key] = value;
    return this;
  }
}
