/*
 * @Author: Libra
 * @Date: 2021-11-17 16:20:05
 * @LastEditTime: 2021-12-02 19:35:47
 * @LastEditors: Libra
 * @Description: dio 适配器
 * @FilePath: /test_flutter/lib/http/core/dio_adapter.dart
 */
import 'package:dio/dio.dart';
import 'package:test_flutter/http/core/hi_error.dart';
import 'package:test_flutter/http/core/hi_net_adapter.dart';
import 'package:test_flutter/http/dao/login_dao.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/log/log.dart';

class DioAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse> send(BaseRequest request) async {
    Response? response;
    var error;
    String authorization = 'authorization';
    var url = request.url();
    // 添加 headers
    if (request.needLogin()) {
      var token = await LoginDao.getToken();
      //给需要登录的接口携带登录令牌
      request.addHeader(authorization, token);
    }
    Options options = Options(headers: request.header);
    try {
      switch (request.httpMethod()) {
        case HttpMethod.GET:
          response = await Dio().get(url, options: options);
          break;
        case HttpMethod.POST:
          request.isFormData()
              ? response = await Dio()
                  .post(url, data: request.formData, options: options)
              : response =
                  await Dio().post(url, data: request.params, options: options);
          break;
        case HttpMethod.DELETE:
          response = await Dio().delete(url, options: options);
          break;
      }
    } on DioError catch (e) {
      error = e;
      response = e.response;
      Log.e(e.toString());
    }
    if (error != null) {
      ///抛出HiNetError
      throw HiNetError(response?.data["code"], error.toString(),
          data: await buildRes(response));
    }
    return buildRes(response);
  }

  ///构建HiNetResponse
  Future<HiNetResponse> buildRes(Response? response) {
    return Future.value(HiNetResponse(response?.data["code"],
        data: response?.data, msg: response?.data["message"]));
  }
}
