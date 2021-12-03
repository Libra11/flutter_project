/*
 * @Author: Libra
 * @Date: 2021-12-03 10:19:34
 * @LastEditTime: 2021-12-03 13:43:31
 * @LastEditors: Libra
 * @Description: JOB INFO
 * @FilePath: /test_flutter/lib/model/job_info_model.dart
 */
class JobInfoModel {
  String? jobUuid;
  String? examUuid;
  String? name;
  String? shortName;
  String? description;
  int? partOpenType;
  bool? isPractice;
  int? timeRule;
  int? jobDuration;
  double? jobScore;
  int? codePartCount;
  String? tip;
  bool? isGroup;
  String? groupConfirmTip;

  JobInfoModel(
      {this.jobUuid,
      this.examUuid,
      this.name,
      this.shortName,
      this.description,
      this.partOpenType,
      this.isPractice,
      this.timeRule,
      this.jobDuration,
      this.jobScore,
      this.codePartCount,
      this.tip,
      this.isGroup,
      this.groupConfirmTip});

  JobInfoModel.fromJson(Map<String, dynamic> json) {
    jobUuid = json['jobUuid'];
    examUuid = json['examUuid'];
    name = json['name'];
    shortName = json['shortName'];
    description = json['description'];
    partOpenType = json['partOpenType'];
    isPractice = json['isPractice'];
    timeRule = json['timeRule'];
    jobDuration = json['jobDuration'];
    jobScore = json['jobScore'];
    codePartCount = json['codePartCount'];
    tip = json['tip'];
    isGroup = json['isGroup'];
    groupConfirmTip = json['groupConfirmTip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jobUuid'] = jobUuid;
    data['examUuid'] = examUuid;
    data['name'] = name;
    data['shortName'] = shortName;
    data['description'] = description;
    data['partOpenType'] = partOpenType;
    data['isPractice'] = isPractice;
    data['timeRule'] = timeRule;
    data['jobDuration'] = jobDuration;
    data['jobScore'] = jobScore;
    data['codePartCount'] = codePartCount;
    data['tip'] = tip;
    data['isGroup'] = isGroup;
    data['groupConfirmTip'] = groupConfirmTip;
    return data;
  }
}
