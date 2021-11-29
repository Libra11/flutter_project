/*
 * @Author: Libra
 * @Date: 2021-11-29 10:16:31
 * @LastEditTime: 2021-11-29 10:28:12
 * @LastEditors: Libra
 * @Description: 用户信息模型
 * @FilePath: /test_flutter/lib/model/candidate_info_model.dart
 */
class CandidateInfoModel {
  String? candidateUuid;
  String? jobUuid;
  String? examUuid;
  String? jobName;
  int? type;
  String? idCardNum;
  int? idCardType;
  String? mobile;
  String? email;
  String? university;
  String? major;
  String? degree;
  String? realName;
  String? avatar;
  String? startedAt;
  String? finishedAt;
  int? countdownBegin;
  List<ExtraInfo>? extraInfo;
  int? faceRecognizeStatus;
  int? faceDifferenceStatus;

  CandidateInfoModel(
      {this.candidateUuid,
      this.jobUuid,
      this.examUuid,
      this.jobName,
      this.type,
      this.idCardNum,
      this.idCardType,
      this.mobile,
      this.email,
      this.university,
      this.major,
      this.degree,
      this.realName,
      this.avatar,
      this.startedAt,
      this.finishedAt,
      this.countdownBegin,
      this.extraInfo,
      this.faceRecognizeStatus,
      this.faceDifferenceStatus});

  CandidateInfoModel.fromJson(Map<String, dynamic> json) {
    candidateUuid = json['candidateUuid'];
    jobUuid = json['jobUuid'];
    examUuid = json['examUuid'];
    jobName = json['jobName'];
    type = json['type'];
    idCardNum = json['idCardNum'];
    idCardType = json['idCardType'];
    mobile = json['mobile'];
    email = json['email'];
    university = json['university'];
    major = json['major'];
    degree = json['degree'];
    realName = json['realName'];
    avatar = json['avatar'];
    startedAt = json['startedAt'];
    finishedAt = json['finishedAt'];
    countdownBegin = json['countdownBegin'];
    if (json['extraInfo'] != null) {
      extraInfo = <ExtraInfo>[];
      json['extraInfo'].forEach((v) {
        extraInfo?.add(ExtraInfo.fromJson(v));
      });
    }
    faceRecognizeStatus = json['faceRecognizeStatus'];
    faceDifferenceStatus = json['faceDifferenceStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidateUuid'] = candidateUuid;
    data['jobUuid'] = jobUuid;
    data['examUuid'] = examUuid;
    data['jobName'] = jobName;
    data['type'] = type;
    data['idCardNum'] = idCardNum;
    data['idCardType'] = idCardType;
    data['mobile'] = mobile;
    data['email'] = email;
    data['university'] = university;
    data['major'] = major;
    data['degree'] = degree;
    data['realName'] = realName;
    data['avatar'] = avatar;
    data['startedAt'] = startedAt;
    data['finishedAt'] = finishedAt;
    data['countdownBegin'] = countdownBegin;
    if (extraInfo != null) {
      data['extraInfo'] = extraInfo?.map((v) => v.toJson()).toList();
    }
    data['faceRecognizeStatus'] = faceRecognizeStatus;
    data['faceDifferenceStatus'] = faceDifferenceStatus;
    return data;
  }
}

class ExtraInfo {
  String? title;
  bool? idRequired;
  int? control;
  List<String>? data;
  String? value;
  List<String>? valueList;

  ExtraInfo(
      {this.title,
      this.idRequired,
      this.control,
      this.data,
      this.value,
      this.valueList});

  ExtraInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    idRequired = json['idRequired'];
    control = json['control'];
    data = json['data'].cast<String>();
    value = json['value'];
    valueList = json['valueList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['idRequired'] = idRequired;
    data['control'] = control;
    data['data'] = this.data;
    data['value'] = value;
    data['valueList'] = valueList;
    return data;
  }
}
