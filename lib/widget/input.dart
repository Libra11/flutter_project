/*
 * @Author: Libra
 * @Date: 2021-12-03 16:21:25
 * @LastEditTime: 2021-12-06 11:51:44
 * @LastEditors: Libra
 * @Description: 
 * @FilePath: /test_flutter/lib/widget/input.dart
 */
import 'package:flutter/material.dart';
import 'package:test_flutter/util/color.dart';

class Input extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final TextEditingController? controller;
  const Input(
      {Key? key,
      this.controller,
      this.labelText,
      this.hintText,
      this.validator,
      this.onChanged})
      : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        focusNode: _focusNode,
        onTap: _requestFocus,
        cursorColor: primary,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: lightColor,
            fontSize: 15,
          ),
          labelStyle:
              TextStyle(color: _focusNode.hasFocus ? primary : lightColor),
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: primary, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: lightColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary, width: 1),
          ),
        ),
        // ???????????????
        validator: widget.validator,
        onChanged: widget.onChanged,
      ),
    );
  }
}
