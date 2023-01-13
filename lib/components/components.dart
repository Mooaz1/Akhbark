import 'package:akhbark/logic/cache/cache_helper.dart';
import 'package:flutter/material.dart';

Widget defultTextFormFiled(
    {required TextEditingController controller,
    required bool obscureText,
    required String labelText,
    required Widget icon,
    
    String? hintText}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30), border: Border.all(width: 1)),
    child: TextFormField(
     
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          hintText: hintText != null ? hintText : "",
          prefixIcon: icon),
    ),
  );
}
bool? dark=CacheHelper.getData(key: "isDark");


