/*
 * @Author: Libra
 * @Date: 2021-12-06 13:12:39
 * @LastEditTime: 2021-12-06 19:10:56
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/pages/camera_page.dart
 */
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/http/core/hi_error.dart';
import 'package:test_flutter/http/dao/candidate/avatar_update_dao.dart';
import 'package:test_flutter/http/dao/monitor/get_token_dao.dart';
import 'package:test_flutter/http/dao/monitor/oss_upload_dao.dart';
import 'package:test_flutter/main.dart';
import 'package:test_flutter/provider/candidate_info.dart';
import 'package:test_flutter/util/color.dart';
import 'package:test_flutter/util/font.dart';
import 'package:test_flutter/util/toast.dart';
import 'package:test_flutter/widget/common_button.dart';
import 'package:test_flutter/widget/common_header.dart';
import 'package:test_flutter/widget/common_layout.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> cameras;
  var controller;
  int type = 1;
  late String imagePath;
  File? file;
  late StateSetter mySetState;

  @override
  initState() {
    print('dddddd');
    print(Provider.of<CandidateInfo>(context, listen: false).info?.avatar);
    super.initState();
  }

  Future<void>? init() async {
    cameras = await availableCameras();
    controller = CameraController(
      cameras[1],
      ResolutionPreset.low,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    await controller.initialize();
  }

  // 切换摄像头
  void switchCamera() async {
    if (controller.description.lensDirection == CameraLensDirection.back) {
      controller = CameraController(
        cameras[1],
        ResolutionPreset.low,
        imageFormatGroup: ImageFormatGroup.yuv420,
      );
    } else {
      controller = CameraController(
        cameras[0],
        ResolutionPreset.low,
        imageFormatGroup: ImageFormatGroup.yuv420,
      );
    }
    await controller.initialize();
    mySetState(() {});
  }

  // 拍照
  void takePhoto() async {
    XFile xfile = await controller.takePicture();
    file = File(xfile.path);
    setState(() {});
  }

  getToken() async {
    try {
      var result = await GetTokenDao.getToken();
      return result;
    } on HiNetError catch (e) {
      ToastUtil.showToast(e.message);
    }
  }

  // 更改图片名字
  Future<File> changeFileName(File file, String newFileName) {
    var path = file.path;
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    var newPath = path.substring(0, lastSeparator + 1) + newFileName;
    return file.rename(newPath);
  }

  // 上传图片
  void uploadImage() async {
    if (imagePath != '') {
      delegate.push(name: '/notice');
      return;
    }
    var res = await getToken();
    String? candidateUuid =
        Provider.of<CandidateInfo>(context, listen: false).info?.candidateUuid;
    file = await changeFileName(file!, '$candidateUuid.jpg');
    String path = '${res.avatarPath}/$candidateUuid.jpg';
    try {
      await OssUploadDao.ossUpload(
          res.accessid, res.policy, res.signature, file, path);
      await AvatarUpdateDao.avatarUpdate(path);
      delegate.push(name: '/notice');
    } on HiNetError catch (e) {
      ToastUtil.showToast(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    imagePath =
        Provider.of<CandidateInfo>(context, listen: false).info?.avatar ?? '';
    return CommonLayout(
        widget: Column(
      children: <Widget>[
        CommonHeader(),
        SizedBox(height: 40),
        FutureBuilder(
          future: init(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return StatefulBuilder(builder: (context, setState) {
                mySetState = setState;
                return Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(125),
                      border: Border.all(color: redColor, width: 1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(125),
                      child: imagePath == ''
                          ? file == null
                              ? AspectRatio(
                                  aspectRatio: controller.value.aspectRatio,
                                  child: CameraPreview(controller),
                                )
                              : Image.file(
                                  file!,
                                  fit: BoxFit.cover,
                                )
                          : Image.network(
                              'http://file-test.stac.fun/$imagePath',
                              fit: BoxFit.cover,
                            ),
                    ));
              });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        SizedBox(height: 40),
        GestureDetector(
          onTap: switchCamera,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.switch_camera,
                  color: primary,
                  size: 28,
                ),
                SizedBox(width: 10),
                Text('切换摄像头', style: fs18)
              ]),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: const [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '建议：可将摄像头太高，仰角45度，从上往下拍照如果摄像头有故障，可直接进行下一步',
                    style: fsl14,
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '提示：请使用前置摄像头，脸部光线不要太暗；',
                    style: fsl14,
                  )),
            ],
          ),
        ),
        SizedBox(height: 20),
        Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CommonButton('上一步', () {
                delegate.push(name: '/basic');
              }, width: 150, height: 40),
              CommonButton(
                  file == null
                      ? imagePath == ''
                          ? '拍照'
                          : '已拍照，下一步'
                      : '已拍照，下一步',
                  file == null
                      ? imagePath == ''
                          ? takePhoto
                          : uploadImage
                      : uploadImage,
                  isHollow: false,
                  width: 150,
                  height: 40),
            ])
      ],
    ));
  }
}
