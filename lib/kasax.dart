import 'dart:async';

import 'package:flutter/services.dart';

class Kasax {
  static const MethodChannel _channel = const MethodChannel('cn.kasax/commmon_utils');

  /// 测试使用
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// 显示系统默认 short时长 toast
  static Future<String> showShortToast(msg) async {
    final String result = await _channel.invokeMethod('showShortToast', {"msg": "$msg"});
    return result;
  }

  /// 显示系统默认 long时长 toast
  static Future<String> showLongToast(msg) async {
    final String result = await _channel.invokeMethod('showLongToast', {"msg": "$msg"});
    return result;
  }
}
