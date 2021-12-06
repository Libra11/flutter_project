/*
 * @Author: Libra
 * @Date: 2021-11-18 15:22:44
 * @LastEditTime: 2021-12-06 16:11:58
 * @LastEditors: Libra
 * @Description: 通用按钮组件
 * @FilePath: /test_flutter/lib/widget/common_button.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/util/color.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  // 是否是空心
  final bool isHollow;
  final double? height;
  final double? width;

  const CommonButton(this.text, this.onPressed,
      {Key? key, this.isHollow = true, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: isHollow
            ? OutlinedButton(
                child: Text(text),
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  primary: redColor,
                  side: BorderSide(width: 1.0, color: redColor),
                ),
              )
            : ElevatedButton(
                child: Text(text),
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(primary: redColor),
              ));
  }
}
