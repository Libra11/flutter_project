/*
 * @Author: Libra
 * @Date: 2021-12-06 12:02:32
 * @LastEditTime: 2021-12-06 12:09:37
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/http/dao/candidate/update_candidate_info_dao.dart
 */
import 'package:test_flutter/http/core/hi_net.dart';
import 'package:test_flutter/http/request/base_request.dart';
import 'package:test_flutter/http/request/candidate/update_candidate_info_request.dart';

class UpdateCandidateInfoDao {
  static updateCandidateInfo(
      String? degree,
      String? idCardNum,
      String? major,
      String? realName,
      String? mobile,
      String? university,
      String? email) async {
    BaseRequest request = UpdateCandidateInfoRequest();
    request.setParams({
      "degree": degree,
      "idCardNum": idCardNum,
      "major": major,
      "realName": realName,
      "mobile": mobile,
      "university": university,
      "email": email,
      "idCardType": "1"
    });
    var result = await HiNet.instance.fire(request);
    result = result.data;
    return result;
  }
}
