/*
 * @Author: Libra
 * @Date: 2021-12-02 15:16:15
 * @LastEditTime: 2021-12-02 15:18:12
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/model/token_model.dart
 */
class Token {
  String? policy;
  String? signature;
  String? dir;
  String? host;
  int? expire;
  String? avatarPath;
  String? answerPath;
  String? monitorCameraPath;
  String? monitorMobilePath;
  String? monitorScreenPath;
  String? attachmentPath;
  String? accessid;

  Token(
      {this.policy,
      this.signature,
      this.dir,
      this.host,
      this.expire,
      this.avatarPath,
      this.answerPath,
      this.monitorCameraPath,
      this.monitorMobilePath,
      this.monitorScreenPath,
      this.attachmentPath,
      this.accessid});

  Token.fromJson(Map<String, dynamic> json) {
    policy = json['policy'];
    signature = json['signature'];
    dir = json['dir'];
    host = json['host'];
    expire = json['expire'];
    avatarPath = json['avatarPath'];
    answerPath = json['answerPath'];
    monitorCameraPath = json['monitorCameraPath'];
    monitorMobilePath = json['monitorMobilePath'];
    monitorScreenPath = json['monitorScreenPath'];
    attachmentPath = json['attachmentPath'];
    accessid = json['accessid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['policy'] = policy;
    data['signature'] = signature;
    data['dir'] = dir;
    data['host'] = host;
    data['expire'] = expire;
    data['avatarPath'] = avatarPath;
    data['answerPath'] = answerPath;
    data['monitorCameraPath'] = monitorCameraPath;
    data['monitorMobilePath'] = monitorMobilePath;
    data['monitorScreenPath'] = monitorScreenPath;
    data['attachmentPath'] = attachmentPath;
    data['accessid'] = accessid;
    return data;
  }
}
