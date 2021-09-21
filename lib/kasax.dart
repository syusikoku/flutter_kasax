import 'dart:async';

import 'package:flutter/services.dart';

class Kasax {
  static const MethodChannel _channel = const MethodChannel('kasax');

  /// 测试使用
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// 显示系统默认 short时长 toast
  static Future<int> showShortToast(msg) async {
    final int result = await _channel.invokeMethod('showShortToast', {"msg": msg});
    return result;
  }

  /// 显示系统默认 long时长 toast
  static Future<int> showLongToast(msg) async {
    final int result = await _channel.invokeMethod('showLongToast', {"msg": msg});
    return result;
  }
}
