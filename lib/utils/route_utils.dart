import 'package:flutter/material.dart';

import 'pagebuilders/slide_bottom2top_anim.dart';
import 'pagebuilders/slide_left2right_anim.dart';
import 'pagebuilders/slide_right2left_anim.dart';
import 'pagebuilders/slide_top2bottom_anim.dart';

/// 界面跳转工具类
class RouteUtils {
  /// 直接跳转:系统默认跳转动画
  static push(BuildContext context, Widget targetPage) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => targetPage));
  }

  /// 跳转并关闭当前
  static pushAndRemoveUntil(BuildContext context, Widget targetPage) {
    Navigator.of(context)
        .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => targetPage), (route) => route == null);
  }

  /// 返回，携带参数
  static pop(BuildContext context, {Object? object}) {
    Navigator.of(context).pop(object!);
  }

  /// 跳转界面从右到左跳转
  static pushRight2Left(BuildContext context, Widget page) {
    Navigator.push(context, SlideRight2Left(page));
  }

  /// 跳转界面从左往右跳转
  static pushLeft2Right(BuildContext context, Widget page) {
    Navigator.push(context, SlideLeft2Right(page));
  }

  /// 跳转界面从下往上跳转
  static pushBottom2Top(BuildContext context, Widget page) {
    Navigator.push(context, SlideBottom2Top(page));
  }

  /// 跳转界面从上往下跳转
  static pushTop2Bottom(BuildContext context, Widget page) {
    Navigator.push(context, SlideTop2Bottom(page));
  }

  /// 切换并携带动画
  static pushWithAnim(BuildContext context, Widget page, PageAnimStyle pageAnimStyle) {
    switch (pageAnimStyle) {
      case PageAnimStyle.LEFT2RIGHT:
        pushLeft2Right(context, page);
        break;
      case PageAnimStyle.RIGHT2LEFT:
        pushRight2Left(context, page);
        break;
      case PageAnimStyle.TOP2BOTTOM:
        pushTop2Bottom(context, page);
        break;
      case PageAnimStyle.BOTTOM2TOP:
        pushTop2Bottom(context, page);
        break;
      default:
        break;
    }
  }
}

/// 动画样式
enum PageAnimStyle { LEFT2RIGHT, RIGHT2LEFT, TOP2BOTTOM, BOTTOM2TOP }
