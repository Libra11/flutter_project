/*
 * @Author: Libra
 * @Date: 2021-12-02 10:14:42
 * @LastEditTime: 2021-12-02 19:36:42
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/pages/test_page.dart
 */
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/http/core/hi_error.dart';
import 'package:test_flutter/http/dao/monitor/get_token_dao.dart';
import 'package:test_flutter/http/dao/monitor/oss_upload_dao.dart';
import 'package:test_flutter/http/dao/monitor/update_slice_dao.dart';
import 'package:test_flutter/log/log.dart';
import 'package:test_flutter/provider/candidate_info.dart';
import 'package:test_flutter/provider/exam_info.dart';
import 'package:test_flutter/util/toast.dart';
import 'package:test_flutter/widget/common_layout.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late List<CameraDescription> cameras;
  var controller;
  XFile? imageFile;
  late String OSSAccessKeyId;
  late String signature;
  late String policy;
  XFile? file;

  Future<void>? init() async {
    cameras = await availableCameras();
    controller = CameraController(
      cameras[0],
      ResolutionPreset.low,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    await controller.initialize();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> startVideoRecording() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      Log.e('请先选择摄像头.');
      return;
    }
    if (cameraController.value.isRecordingVideo) {
      return;
    }
    try {
      return await cameraController.startVideoRecording();
    } on CameraException catch (e) {
      Log.e(e);
      return;
    }
  }

  void recordVideoEverySecond() async {
    await startVideoRecording();
    Timer.periodic(Duration(seconds: 15), (timer) async {
      XFile? file = await stopVideoRecording();
      await startVideoRecording();
      // 获取时间戳
      var timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      String fileName = 'testMobile/$timeStamp.mp4';
      updateSlice('$timeStamp.mp4', fileName);
      upLoadFile(file, fileName);
    });
  }

  Future<XFile?> stopVideoRecording() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return null;
    }
    try {
      XFile file = await cameraController.stopVideoRecording();
      return file;
    } on CameraException catch (e) {
      Log.e(e);
      return null;
    }
  }

  getToken() async {
    try {
      var result = await GetTokenDao.getToken();
      return result;
    } on HiNetError catch (e) {
      ToastUtil.showToast(e.message);
    }
  }

  void upLoadFile(XFile? file, fileName) async {
    var res = await getToken();
    try {
      OssUploadDao.ossUpload(
          res.accessid, res.policy, res.signature, file, fileName);
    } on HiNetError catch (e) {
      ToastUtil.showToast(e.message);
    }
  }

  void updateSlice(String name, String path) async {
    String? candidateUuid =
        Provider.of<CandidateInfo>(context, listen: false).info?.candidateUuid;
    String? examUuid =
        Provider.of<ExamInfo>(context, listen: false).info?.examUuid;
    await UpdateSliceDao.updateSlice(candidateUuid, examUuid, name, path, '17');
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hasLogo: true,
      widget: FutureBuilder<void>(
        future: init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(children: <Widget>[
              controller.value.isInitialized
                  ? SizedBox(height: 400, child: CameraPreview(controller))
                  : Container(),
              TextButton(
                onPressed: recordVideoEverySecond,
                child: Text('开始录制'),
              ),
              TextButton(
                onPressed: getToken,
                child: Text('获取token'),
              )
            ]);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
