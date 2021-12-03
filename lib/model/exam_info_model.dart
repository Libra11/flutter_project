/*
 * @Author: Libra
 * @Date: 2021-11-26 17:52:38
 * @LastEditTime: 2021-11-29 10:18:37
 * @LastEditors: Libra
 * @Description: 考试信息模型
 * @FilePath: /test_flutter/lib/model/exam_info_model.dart
 */
class ExamInfoModel {
  String? examUuid;
  String? name;
  String? shortName;
  String? startAt;
  String? endAt;
  bool? isFaceRecognizeNeed;
  bool? isEnableCalculator;
  bool? isEnableSecretary;
  int? checkScore;
  int? examType;
  int? fromType;
  String? endNote;
  String? partNote;
  String? confirmNote;
  String? practiceNote;
  int? status;
  int? repeatAnswerTimes;
  int? cameraMonitorType;
  int? cameraVideoType;
  int? mobileMonitorType;
  int? screenShotMonitorType;
  String? userExamName;
  String? scenario;
  CandidateInfo? candidateInfo;
  List<ExtraCandidateInfo>? extraCandidateInfo;
  int? maximizeScreen;
  int? mobileVideoType;
  int? isEnableViewReport;
  int? screenShotVideoType;
  String? qualificationsNote;
  bool? isWatermark;
  int? leaveCountLimit;
  String? groupConfirmTip;

  ExamInfoModel(
      {this.examUuid,
      this.name,
      this.shortName,
      this.startAt,
      this.endAt,
      this.isFaceRecognizeNeed,
      this.isEnableCalculator,
      this.isEnableSecretary,
      this.checkScore,
      this.examType,
      this.fromType,
      this.endNote,
      this.partNote,
      this.confirmNote,
      this.practiceNote,
      this.status,
      this.repeatAnswerTimes,
      this.cameraMonitorType,
      this.cameraVideoType,
      this.mobileMonitorType,
      this.screenShotMonitorType,
      this.userExamName,
      this.scenario,
      this.candidateInfo,
      this.extraCandidateInfo,
      this.maximizeScreen,
      this.mobileVideoType,
      this.isEnableViewReport,
      this.screenShotVideoType,
      this.qualificationsNote,
      this.isWatermark,
      this.leaveCountLimit,
      this.groupConfirmTip});

  ExamInfoModel.fromJson(Map<String, dynamic> json) {
    examUuid = json['examUuid'];
    name = json['name'];
    shortName = json['shortName'];
    startAt = json['startAt'];
    endAt = json['endAt'];
    isFaceRecognizeNeed = json['isFaceRecognizeNeed'];
    isEnableCalculator = json['isEnableCalculator'];
    isEnableSecretary = json['isEnableSecretary'];
    checkScore = json['checkScore'];
    examType = json['examType'];
    fromType = json['fromType'];
    endNote = json['endNote'];
    partNote = json['partNote'];
    confirmNote = json['confirmNote'];
    practiceNote = json['practiceNote'];
    status = json['status'];
    repeatAnswerTimes = json['repeatAnswerTimes'];
    cameraMonitorType = json['cameraMonitorType'];
    cameraVideoType = json['cameraVideoType'];
    mobileMonitorType = json['mobileMonitorType'];
    screenShotMonitorType = json['screenShotMonitorType'];
    userExamName = json['userExamName'];
    scenario = json['scenario'];
    candidateInfo = json['candidateInfo'] != null
        ? CandidateInfo.fromJson(json['candidateInfo'])
        : null;
    if (json['extraCandidateInfo'] != null) {
      extraCandidateInfo = <ExtraCandidateInfo>[];
      json['extraCandidateInfo'].forEach((v) {
        extraCandidateInfo?.add(ExtraCandidateInfo.fromJson(v));
      });
    }
    maximizeScreen = json['maximizeScreen'];
    mobileVideoType = json['mobileVideoType'];
    isEnableViewReport = json['isEnableViewReport'];
    screenShotVideoType = json['screenShotVideoType'];
    qualificationsNote = json['qualificationsNote'];
    isWatermark = json['isWatermark'];
    leaveCountLimit = json['leaveCountLimit'];
    groupConfirmTip = json['groupConfirmTip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['examUuid'] = examUuid;
    data['name'] = name;
    data['shortName'] = shortName;
    data['startAt'] = startAt;
    data['endAt'] = endAt;
    data['isFaceRecognizeNeed'] = isFaceRecognizeNeed;
    data['isEnableCalculator'] = isEnableCalculator;
    data['isEnableSecretary'] = isEnableSecretary;
    data['checkScore'] = checkScore;
    data['examType'] = examType;
    data['fromType'] = fromType;
    data['endNote'] = endNote;
    data['partNote'] = partNote;
    data['confirmNote'] = confirmNote;
    data['practiceNote'] = practiceNote;
    data['status'] = status;
    data['repeatAnswerTimes'] = repeatAnswerTimes;
    data['cameraMonitorType'] = cameraMonitorType;
    data['cameraVideoType'] = cameraVideoType;
    data['mobileMonitorType'] = mobileMonitorType;
    data['screenShotMonitorType'] = screenShotMonitorType;
    data['userExamName'] = userExamName;
    data['scenario'] = scenario;
    if (candidateInfo != null) {
      data['candidateInfo'] = candidateInfo?.toJson();
    }
    if (extraCandidateInfo != null) {
      data['extraCandidateInfo'] =
          extraCandidateInfo?.map((v) => v.toJson()).toList();
    }
    data['maximizeScreen'] = maximizeScreen;
    data['mobileVideoType'] = mobileVideoType;
    data['isEnableViewReport'] = isEnableViewReport;
    data['screenShotVideoType'] = screenShotVideoType;
    data['qualificationsNote'] = qualificationsNote;
    data['isWatermark'] = isWatermark;
    data['leaveCountLimit'] = leaveCountLimit;
    data['groupConfirmTip'] = groupConfirmTip;
    return data;
  }
}

class CandidateInfo {
  bool isRealNameRequired = false;
  bool isRealNameEditable = false;
  bool isMobileRequired = false;
  bool isMobileEditable = false;
  bool isEmailRequired = false;
  bool isEmailEditable = false;
  bool isUniversityRequired = false;
  bool isUniversityEditable = false;
  bool isDegreeRequired = false;
  bool isDegreeEditable = false;
  bool isMajorRequired = false;
  bool isMajorEditable = false;
  bool isIdCardNumRequired = false;
  bool isIdCardNumEditable = false;

  CandidateInfo(
      {this.isRealNameRequired = false,
      this.isRealNameEditable = false,
      this.isMobileRequired = false,
      this.isMobileEditable = false,
      this.isEmailRequired = false,
      this.isEmailEditable = false,
      this.isUniversityRequired = false,
      this.isUniversityEditable = false,
      this.isDegreeRequired = false,
      this.isDegreeEditable = false,
      this.isMajorRequired = false,
      this.isMajorEditable = false,
      this.isIdCardNumRequired = false,
      this.isIdCardNumEditable = false});

  CandidateInfo.fromJson(Map<String, dynamic> json) {
    isRealNameRequired = json['isRealNameRequired'];
    isRealNameEditable = json['isRealNameEditable'];
    isMobileRequired = json['isMobileRequired'];
    isMobileEditable = json['isMobileEditable'];
    isEmailRequired = json['isEmailRequired'];
    isEmailEditable = json['isEmailEditable'];
    isUniversityRequired = json['isUniversityRequired'];
    isUniversityEditable = json['isUniversityEditable'];
    isDegreeRequired = json['isDegreeRequired'];
    isDegreeEditable = json['isDegreeEditable'];
    isMajorRequired = json['isMajorRequired'];
    isMajorEditable = json['isMajorEditable'];
    isIdCardNumRequired = json['isIdCardNumRequired'];
    isIdCardNumEditable = json['isIdCardNumEditable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isRealNameRequired'] = isRealNameRequired;
    data['isRealNameEditable'] = isRealNameEditable;
    data['isMobileRequired'] = isMobileRequired;
    data['isMobileEditable'] = isMobileEditable;
    data['isEmailRequired'] = isEmailRequired;
    data['isEmailEditable'] = isEmailEditable;
    data['isUniversityRequired'] = isUniversityRequired;
    data['isUniversityEditable'] = isUniversityEditable;
    data['isDegreeRequired'] = isDegreeRequired;
    data['isDegreeEditable'] = isDegreeEditable;
    data['isMajorRequired'] = isMajorRequired;
    data['isMajorEditable'] = isMajorEditable;
    data['isIdCardNumRequired'] = isIdCardNumRequired;
    data['isIdCardNumEditable'] = isIdCardNumEditable;
    return data;
  }
}

class ExtraCandidateInfo {
  String? title;
  bool? idRequired;
  int? control;
  List<String>? data;
  String? value;
  List<String>? valueList;

  ExtraCandidateInfo(
      {this.title,
      this.idRequired,
      this.control,
      this.data,
      this.value,
      this.valueList});

  ExtraCandidateInfo.fromJson(Map<String, dynamic> json) {
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
