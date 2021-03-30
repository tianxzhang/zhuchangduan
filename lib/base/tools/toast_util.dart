import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {

  static void showToast(String message,{bool b}){
    Fluttertoast.showToast(
      msg: message,
      toastLength:Toast.LENGTH_SHORT,
      gravity: b!=null?ToastGravity.TOP:ToastGravity.CENTER,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
}