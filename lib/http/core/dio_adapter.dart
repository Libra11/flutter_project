/*
 * @Author: Libra
 * @Date: 2021-11-17 16:20:05
 * @LastEditTime: 2021-11-18 17:02:02
 * @LastEditors: Libra
 * @Description: dio 适配器
 * @FilePath: /test_flutter/lib/http/core/dio_adapter.dart
 */
import 'package:dio/dio.dart';
import 'package:test_flutter/http/core/hi_error.dart';
import 'package:test_flutter/http/core/hi_net_adapter.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/log/log.dart';

class DioAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse> send(BaseRequest request) async {
    Response? response;
    var error;
    Options options = Options(headers: request.header);
    try {
      switch (request.httpMethod()) {
        case HttpMethod.GET:
          response = await Dio().get(request.url(), options: options);
          break;
        case HttpMethod.POST:
          response = await Dio()
              .post(request.url(), data: request.params, options: options);
          break;
        case HttpMethod.DELETE:
          response = await Dio().delete(request.url(), options: options);
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