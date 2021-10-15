import 'package:flutter/material.dart';

class RouteUtils {
  // 直接跳转
  static push(BuildContext context, Widget targetPage) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => targetPage));
  }

  // 跳转并关闭当前
  static pushAndRemoveUntil(BuildContext context, Widget targetPage) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => targetPage),
        (route) => route == null);
  }

  // 返回，携带参数
  static pop(BuildContext context, {Object? object}) {
    Navigator.of(context).pop(object!);
  }
}
