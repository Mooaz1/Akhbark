import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';


class Utils{
  static final messangerkey=GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text,Color?color){
    if(text ==null) return;
    final snackbar=SnackBar(content: Text(text),backgroundColor: color,);
    messangerkey.currentState!..removeCurrentSnackBar()..showSnackBar(snackbar);

  }
}