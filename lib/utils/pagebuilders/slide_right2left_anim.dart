import 'package:flutter/material.dart';

/// 从右到左打开页面: 左右滑动路由动画
/// 未验证过
class SlideRight2Left extends PageRouteBuilder {
  final Widget widget;
  final int duration;

  /// 动画效果从右边到左边的参数(primary)
  final Tween _primaryTweenSlideRightToLeft = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero);

  /// 动画效果从右边到左边的参数(secondary)
  final Tween _secondaryTweenSlideRightToLeft = Tween(begin: Offset.zero, end: const Offset(-1.0, 0.0));

  SlideRight2Left(this.widget, {this.duration = 300})
      : super(
            transitionDuration: Duration(milliseconds: duration),
            pageBuilder: (context, anim1, anim2) {
              return widget;
            },
            transitionsBuilder: (context, anim1, anim2, child) {
              return SlideTransition(
                position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(parent: anim1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
