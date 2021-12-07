/*
 * @Author: Libra
 * @Date: 2021-12-07 11:07:58
 * @LastEditTime: 2021-12-07 11:09:03
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/http/dao/exam/get_paper_list_dao.dart
 */
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/http/request/exam/get_paper_list_request.dart';

class GetPaperListDao {
  static getPaperList() async {
    BaseRequest request = GetPaperListRequest();
    var result = await HiNet.instance.fire(request);
    return result;
  }
}
