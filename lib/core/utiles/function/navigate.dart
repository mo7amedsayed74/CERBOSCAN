// context.navigateTo();
import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  void navigatePush({
    required Widget screenToView,
  }) async {
    await Navigator.push(
      this,
      // this keyWord refers to context that call this function (navigateTo)
      MaterialPageRoute(
        builder: (context) => screenToView,
      ),
    );
  }

  void navigatePushReplacement({
    required Widget screenToView,
  }) async {
    await Navigator.pushReplacement(
        this,
        // this keyWord refers to context that call this function (navigateTo)
        MaterialPageRoute(
          builder: (context) => screenToView,
        ));
  }
}