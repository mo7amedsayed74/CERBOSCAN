
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String msg,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      // المده اللي هتظهرها في الاندرويد
      gravity: ToastGravity.BOTTOM,
      // هتظهر فين
      timeInSecForIosWeb: 5,
      // المده اللي هتظهرها في الويب و ال ios
      backgroundColor: toastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { success, error, warning }

Color toastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.yellow;
      break;
  }
  return color;
}
