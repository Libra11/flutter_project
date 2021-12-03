/*
 * @Author: Libra
 * @Date: 2021-12-03 11:09:08
 * @LastEditTime: 2021-12-03 11:10:37
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/http/dao/exam/job_info_dao.dart
 */
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/http/request/exam/job_info_request.dart';
import 'package:test_flutter/model/job_info_model.dart';

class JobInfoDao {
  static getJobInfo() async {
    BaseRequest request = JobInfoRequest();
    var result = await HiNet.instance.fire(request);
    return JobInfoModel.fromJson(result.data['data']);
  }
}
