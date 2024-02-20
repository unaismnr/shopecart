import 'package:flutter/material.dart';
import 'package:shopecart/utils/consts.dart';

class LogRegTextField extends StatelessWidget {
  final String hintText;
  final int lines;
  final TextInputType keyboradtype;
  final bool obscureText;
  final String? Function(String?)? validator;
  final double height;
  final TextEditingController controller;

  const LogRegTextField({
    super.key,
    required this.hintText,
    this.lines = 1,
    this.keyboradtype = TextInputType.text,
    this.obscureText = false,
    required this.validator,
    this.height = 50,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: mainColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: mainColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: mainColor,
            ),
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        maxLines: lines,
        obscureText: obscureText,
        keyboardType: keyboradtype,
        validator: validator,
      ),
    );
  }
}
