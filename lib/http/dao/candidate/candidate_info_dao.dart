/*
 * @Author: Libra
 * @Date: 2021-11-29 09:49:45
 * @LastEditTime: 2021-11-29 10:31:01
 * @LastEditors: Libra
 * @Description: 考生信息 dao
 * @FilePath: /test_flutter/lib/http/dao/candidate_info_dao.dart
 */
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/http/request/candidate/candidate_info_request.dart';
import 'package:test_flutter/model/candidate_info_model.dart';

class CandidateInfoDao {
  static getCandidateInfo() async {
    BaseRequest request = CandidateInfoRequest();
    var result = await HiNet.instance.fire(request);
    return CandidateInfoModel.fromJson(result.data['data']);
  }
}
