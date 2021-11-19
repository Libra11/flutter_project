/*
 * @Author: Libra
 * @Date: 2021-11-19 10:25:18
 * @LastEditTime: 2021-11-19 10:53:58
 * @LastEditors: Libra
 * @Description: toast 组件封装
 * @FilePath: /test_flutter/lib/util/toast.dart
 */
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_flutter/util/color.dart';

// fluttertoast 封装
class ToastUtil {
  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: primary,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
